data "cloudflare_account" "current" {
  account_id = var.account_id
}

data "cloudflare_zone" "default" {
  zone_id = var.zone_id
}
