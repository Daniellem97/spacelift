resource "spacelift_policy" "admin_login" {
  name     = "Admin-Login-Policy2"
  body     = file("test.rego")
  space_id = "root"
  type     = "LOGIN"
}

resource "spacelift_stack" "ec2-stack" {

  github_enterprise {
    namespace = "daniellem97"
  }

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "aws-ec2"
}
