resource "spacelift_stack" "ec2-stack" {

  github_enterprise {
    namespace = "daniellem97"
  }

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "aws-ec2"
  terraform_version = "1.5.0"
}
