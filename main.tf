resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  space_id        = "legacy"
}

resource "spacelift_module" "k8s-module" {
  name               = "k8s-module"
  terraform_provider = "aws"
  administrative     = true
  branch             = "main"
  description        = "Infra terraform module"
  repository         = "testmultimodule"
  project_root       ="multimodule-main 2/uuid"
}

resource "spacelift_environment_variable" "core-kubeconfig" {
  stack_id   = "development-stack"
  name       = "KUBECONFIG"
  value      = "/project/spacelift/kubeconfig"
  write_only = true
}

resource "spacelift_webhook" "webhook" {
  endpoint = "https://webhook.site/2ac4f85a-df59-4c94-a4e5-0d2ea40502dd"
  stack_id = "development-stack"
  secret = "test1"
}
