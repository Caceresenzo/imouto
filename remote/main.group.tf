resource "cloudflare_zero_trust_access_group" "enzo" {
  account_id = data.cloudflare_account.current.account_id
  name       = "enzo caceres"
  is_default = true

  include = [
    {
      email = {
        email = "caceresenzo1502@gmail.com"
      }
    }
  ]
}
