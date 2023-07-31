resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  terraform_version = "1.5.0"
}

resource "spacelift_policy" "admin_login" {
  name     = "Admin-Login-Policy2"
  body     = file("test.rego")
  space_id = "root"
  type     = "LOGIN"
}
