resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  space_id        = "legacy"
  terraform_version = "1.5.2"
}

resource "spacelift_stack" "ec2-stack2" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack2"
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

resource "spacelift_context" "prod-k8s-ie" {
  name        = "Production cluster (Ireland)"
  description = "Configuration details for the compute cluster in Ireland"

  before_init = [
    "echo Setting up initial configuration..."
  ]

  // You can also include other hooks like after_apply, before_plan, etc.
  after_apply = [
    "echo Apply completed"
  ]
}
