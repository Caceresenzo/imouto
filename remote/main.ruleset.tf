resource "cloudflare_ruleset" "http_request_late_transform" {
  zone_id = data.cloudflare_zone.default.zone_id
  kind    = "zone"
  name    = "default"
  phase   = "http_request_late_transform"
  rules = [
    {
      description = "sonarr auth"
      enabled     = true
      expression  = "(http.host eq \"${module.imouto_applications["sonarr"].full_domain}\")"
      action      = "rewrite"
      action_parameters = {
        headers = {
          authorization = {
            operation = "set"
            value     = "Basic YWRtaW46cGFzc3dvcmQ="
          }
        }
      }
    },
    {
      description = "filebrowser auth"
      enabled     = true
      expression  = "(http.host eq \"${module.imouto_applications["filebrowser"].full_domain}\")"
      action      = "rewrite"
      action_parameters = {
        headers = {
          "X-Username" = {
            operation = "set"
            value     = "admin"
          }
        }
      }
    }
  ]
}

/* inspired from https://community.cloudflare.com/t/hpe-ilo-through-cloudflare-tunnel/548459 */
resource "cloudflare_ruleset" "http_response_headers_transform" {
  zone_id = data.cloudflare_zone.default.zone_id
  kind    = "zone"
  name    = "default"
  phase   = "http_response_headers_transform"
  rules = [
    {
      description = "ilo content-security-policy"
      enabled     = true
      expression  = "(http.host wildcard \"ilo--*.${data.cloudflare_zone.default.name}\")"
      action      = "rewrite"
      action_parameters = {
        headers = {
          "Content-Security-Policy" = {
            operation  = "set"
            expression = "concat(\"default-src https: 'unsafe-inline' data: 'unsafe-eval' ; connect-src 'self' wss://\", http.host, \";\")"
          }
        }
      }
    }
  ]
}
