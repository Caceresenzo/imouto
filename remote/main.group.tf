resource "cloudflare_zero_trust_access_group" "enzo" {
  account_id = var.account_id
  name       = "enzo"

  is_default = true

  include = [
    {
      email = {
        email = var.enzo_email
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
        email = var.dorian_email
      }
    }
  ]
}
