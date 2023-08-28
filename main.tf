resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
}

data "spacelift_gcp_service_account" "privateaws" {
  stack_id = "privateaws"
}
