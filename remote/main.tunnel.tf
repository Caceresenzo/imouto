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
