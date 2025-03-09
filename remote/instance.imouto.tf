locals {
  imouto_applications = [
    {
      type    = "self_hosted"
      name    = "deluge",
      service = "http://172.17.0.1:8112",
      icon    = "deluge.png",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.dorian.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "filebrowser",
      service = "http://172.17.0.1:5082",
      icon    = "filebrowser.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.dorian.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "grafana",
      service = "http://172.17.0.1:3000",
      icon    = "grafana.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "plex",
      service = "http://172.17.0.1:32400",
      icon    = "plex.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "qbittorrent",
      service = "http://172.17.0.1:8090",
      icon    = "qbittorrent.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.dorian.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "sonarr",
      service = "http://172.17.0.1:8989",
      icon    = "sonarr.png",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.dorian.id,
      ],
    },
    {
      type    = "ssh"
      name    = "ssh",
      service = "ssh://172.17.0.1:22",
      icon    = "ssh.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
      ],
    },
    {
      type    = "self_hosted"
      name    = "syncthing",
      service = "http://172.17.0.1:8384",
      icon    = "syncthing.svg",
      groups = [
        cloudflare_zero_trust_access_group.enzo.id,
        cloudflare_zero_trust_access_group.dorian.id,
      ],
    },
  ]
}

module "imouto_applications" {
  for_each = {
    for entry in local.imouto_applications : (entry.name) => entry
  }

  source = "./modules/application"

  account_id    = var.account_id
  zone_id       = var.zone_id
  google_idp_id = var.google_idp_id
  tunnel_id     = var.imouto_tunnel_id

  type             = each.value.type
  instance_name    = "imouto"
  application_name = each.value.name
  icon_file        = each.value.icon
  group_ids        = each.value.groups
  tags             = [cloudflare_zero_trust_access_tag.imouto.name]
}

resource "cloudflare_zero_trust_access_tag" "imouto" {
  account_id = data.cloudflare_account.current.account_id
  name       = "imouto"
}

resource "cloudflare_zero_trust_tunnel_cloudflared_config" "imouto" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = var.imouto_tunnel_id

  config = {
    ingress = concat(
      [
        for entry in local.imouto_applications : {
          hostname = module.imouto_applications[entry.name].full_domain
          service  = entry.service
        }
      ],
      [
        {
          service = "http_status:404"
        }
      ]
    )
  }
}
