resource "cloudflare_zero_trust_access_group" "users" {
  for_each = local.user_map

  account_id = data.cloudflare_account.current.account_id

  name       = each.key
  is_default = true

  include = [
    {
      email = {
        email = each.value.email
      }
    }
  ]
}
