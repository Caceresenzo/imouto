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

resource "cloudflare_zero_trust_access_group" "maxence" {
  account_id = var.account_id
  name       = "maxence"

  include = [
    {
      email = {
        email = var.maxence_email
      }
    }
  ]
}

resource "cloudflare_zero_trust_access_group" "sandrine" {
  account_id = var.account_id
  name       = "sandrine"

  include = [
    {
      email = {
        email = var.sandrine_email
      }
    }
  ]
}
