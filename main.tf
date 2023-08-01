resource "spacelift_policy" "admin_login" {
  name     = "Admin-Login-Policy2"
  body     = file("test.rego")
  space_id = "test"
  type     = "LOGIN"
}
