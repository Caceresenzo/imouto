locals {
  control_tower_applications = [
    {
      name    = "uptime-kuma",
      service = "http://172.17.0.1:3001",
      icon    = "uptime-kuma.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      name    = "ssh",
      service = "ssh://172.17.0.1:22",
      icon    = "ssh.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      name    = "esxi",
      service = "https://192.168.0.6",
      icon    = "esxi.png",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      name    = "ilo",
      service = "https://192.168.0.2",
      icon    = "ilo.png",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
  ]
}

module "control_tower_applications" {
  for_each = {
    for entry in local.control_tower_applications : (entry.name) => entry
  }

  source = "./modules/application"

  account_id    = var.account_id
  zone_id       = var.zone_id
  google_idp_id = var.google_idp_id
  tunnel_id     = var.control_tower_tunnel_id

  instance_name    = "control-tower"
  application_name = each.value.name
  icon_file        = each.value.icon
  group_ids        = each.value.groups
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "control_tower" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = var.control_tower_tunnel_id

  config = {
    ingress = concat(
      [
        for entry in local.control_tower_applications : {
          hostname = module.control_tower_applications[entry.name].full_domain
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
