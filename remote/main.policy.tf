resource "cloudflare_zero_trust_access_policy" "public" {
  account_id = data.cloudflare_account.current.account_id
  decision   = "bypass"
  name       = "Public"
  include = [
    {
      everyone = {}
    }
  ]
  session_duration = "24h"
}
