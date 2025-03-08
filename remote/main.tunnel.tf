data "cloudflare_zero_trust_tunnel_cloudflared" "imouto" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = var.imouto_tunnel_id
}

locals {
  services = jsondecode(file("services.imouto.json"))
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "config" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = data.cloudflare_zero_trust_tunnel_cloudflared.imouto.tunnel_id

  config = {
    ingress = concat(
      [
        for entry in local.services : {
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

resource "cloudflare_zero_trust_access_application" "grafana" {
  account_id = data.cloudflare_account.current.account_id

  type   = "self_hosted"
  name   = "grafana (test)"
  domain = "test--grafana--imouto.${data.cloudflare_zone.main.name}"

  self_hosted_domains = [
    "test--grafana--imouto.${data.cloudflare_zone.main.name}"
  ]

  destinations = [
    {
      type = "public"
      uri  = "test--grafana--imouto.${data.cloudflare_zone.main.name}"
    }
  ]

  logo_url             = "https://www.cloudflare.com/img/logo-web-badges/cf-logo-on-white-bg.svg"
  app_launcher_visible = true

  allowed_idps              = [var.google_idp_id]
  auto_redirect_to_identity = true


  policies = [
    {
      decision = "allow"
      id = cloudflare_zero_trust_access_policy.public.id
      precedence = 0
    }
  ]

  tags = []
}

resource "cloudflare_dns_record" "example_dns_record" {
  zone_id = data.cloudflare_zone.main.zone_id

  name    = "test--grafana--imouto"
  type    = "CNAME"
  content = "${data.cloudflare_zero_trust_tunnel_cloudflared.imouto.tunnel_id}.cfargotunnel.com"
  proxied = true
  ttl     = 1
}
