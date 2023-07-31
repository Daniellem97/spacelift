resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  terraform_version = "1.5.0"
}

resource "spacelift_policy" "admin_login" {
  name     = "Admin Login Policy"
  body     = "package spacelift /n sample {true}"
  space_id = "root"
  type     = "LOGIN"
}
