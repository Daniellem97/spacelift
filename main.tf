resource "spacelift_stack" "ec2-stack" {

  github_enterprise {
    namespace = "Daniellem97"
  }

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "testtf"
  terraform_version = "1.5.0"
}
