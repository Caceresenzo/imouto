locals {
  marais_applications = [
    {
      type    = "self_hosted"
      name    = "negrosa",
      service = "http://172.17.0.1:80",
      icon    = null,
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.sandrine.id,
      ],
    },
    {
      type    = "ssh"
      name    = "ssh",
      service = "ssh://172.17.0.1:22",
      icon    = "ssh.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.sandrine.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "ilo--imouto--via",
      service = "https://192.168.0.2",
      icon    = "ilo.png",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
  ]
}

module "marais_applications" {
  for_each = {
    for entry in local.marais_applications : (entry.name) => entry
  }

  source = "./modules/application"

  account_id    = var.account_id
  zone_id       = var.zone_id
  google_idp_id = var.google_idp_id
  tunnel_id     = var.marais_tunnel_id

  type             = each.value.type
  instance_name    = "marais"
  application_name = each.value.name
  icon_file        = each.value.icon
  group_ids        = each.value.groups
  tags             = [cloudflare_zero_trust_access_tag.marais.name]
}

resource "cloudflare_zero_trust_access_tag" "marais" {
  account_id = data.cloudflare_account.current.account_id
  name       = "marais"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "marais" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = var.marais_tunnel_id

  config = {
    ingress = concat(
      [
        for entry in local.marais_applications : {
          hostname = module.marais_applications[entry.name].full_domain
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
