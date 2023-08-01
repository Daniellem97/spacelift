resource "spacelift_policy" "admin_login" {
  name     = "Admin-Login-Policy2"
  body     = file("test.rego")
  space_id = "test-01H6R294WFHS13BVF89C7W7BG6"
  type     = "LOGIN"
}
