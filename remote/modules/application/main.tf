data "cloudflare_zero_trust_tunnel_cloudflared" "default" {
  account_id = var.account_id
  tunnel_id  = var.tunnel_id
}

data "cloudflare_zone" "default" {
  zone_id = var.zone_id
}

locals {
  slug_instance_name    = replace(lower(var.instance_name), " ", "-")
  slug_application_name = replace(lower(var.application_name), " ", "-")

  sub_domain  = "${local.slug_application_name}--${local.slug_instance_name}"
  full_domain = "${local.sub_domain}.${data.cloudflare_zone.default.name}"
}

resource "cloudflare_zero_trust_access_application" "default" {
  account_id = var.account_id

  type   = "self_hosted"
  name   = "${var.application_name} (${var.instance_name})"
  domain = local.full_domain

  self_hosted_domains = [
    local.full_domain
  ]

  destinations = [
    {
      type = "public"
      uri  = local.full_domain
    }
  ]

  http_only_cookie_attribute = true

  logo_url             = "https://raw.githubusercontent.com/Caceresenzo/imouto/refs/heads/master/remote/icons/${var.icon_file}"
  app_launcher_visible = true

  allowed_idps              = [var.google_idp_id]
  auto_redirect_to_identity = true

  policies = [
    {
      name     = "default"
      decision = "allow"
      include = [
        for group_id in var.group_ids : {
          group = {
            id = group_id
          }
        }
      ]
    }
  ]

  tags = []
}

resource "cloudflare_dns_record" "default" {
  zone_id = data.cloudflare_zone.default.zone_id

  name    = local.sub_domain
  type    = "CNAME"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.default.tunnel_id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}
