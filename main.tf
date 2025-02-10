resource "spacelift_audit_trail_webhook" "example" {
  endpoint = "https://webhook.site/bc8524c1-a1fb-4204-b9b2-2eba23642508"
  enabled  = true
  secret   = "mysecretkey"
lifecycle {
    ignore_changes = [secret]
  }
}
