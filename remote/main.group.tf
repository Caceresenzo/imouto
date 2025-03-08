resource "cloudflare_zero_trust_access_group" "enzo" {
  account_id = var.account_id
  name       = "enzo"

  is_default = true

  include = [
    {
      email = {
        email = "caceresenzo1502@gmail.com"
      }
    }
  ]
}

resource "cloudflare_zero_trust_access_group" "dorian" {
  account_id = var.account_id
  name       = "dorian"

  include = [
    {
      email = {
        email = "thecaceresenzo@gmail.com"
      }
    }
  ]
}
