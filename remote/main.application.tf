locals {
  configuration = jsondecode(file("configuration.json"))
  user_map = {
    for entry in local.configuration.users : (entry.name) => entry
  }
  service_map = {
    for entry in local.configuration.services : (entry.name) => entry
  }
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "config" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = data.cloudflare_zero_trust_tunnel_cloudflared.imouto.tunnel_id

  config = {
    ingress = concat(
      [
        for entry in local.configuration.services : {
          hostname = "${entry.name}--imouto.${data.cloudflare_zone.main.name}"
          service  = entry.service
        }
      ],
      [
        {
          service = "http_status:404"
        }
      ]
    )
    origin_request = {
      no_tls_verify = true
    }
  }
}

resource "cloudflare_zero_trust_access_application" "services" {
  for_each = local.service_map

  account_id = data.cloudflare_account.current.account_id

  type   = "self_hosted"
  name   = "${each.value.display_name} (Imouto)"
  domain = "${each.value.name}--imouto.${data.cloudflare_zone.main.name}"

  self_hosted_domains = [
    "${each.value.name}--imouto.${data.cloudflare_zone.main.name}"
  ]

  destinations = [
    {
      type = "public"
      uri  = "${each.value.name}--imouto.${data.cloudflare_zone.main.name}"
    }
  ]

  http_only_cookie_attribute = true

  logo_url             = "https://github.com/Caceresenzo/imouto/blob/master/remote/icons/${each.value.icon}?raw=true"
  app_launcher_visible = true

  allowed_idps              = [var.google_idp_id]
  auto_redirect_to_identity = true

  policies = [
    {
      name     = "default"
      decision = "allow"
      include = [
        for entry in each.value.access : {
          group = {
            id = cloudflare_zero_trust_access_group.users[entry].id
          }
        }
      ]
    }
  ]

  tags = []
}

resource "cloudflare_dns_record" "services" {
  for_each = local.service_map

  zone_id = data.cloudflare_zone.main.zone_id

  name    = "${each.value.name}--imouto"
  type    = "CNAME"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.imouto.tunnel_id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}
