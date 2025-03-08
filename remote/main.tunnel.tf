data "cloudflare_zero_trust_tunnel_cloudflared" "imouto" {
  account_id = data.cloudflare_account.current.account_id
  tunnel_id  = var.imouto_tunnel_id
}
