resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  space_id        = "legacy"
  terraform_version = "1.5.2"
  worker_pool_id    = file("/mnt/workspace/TF_VAR_new_worker_pool_id")

}

resource "spacelift_scheduled_task" "rotate_app_reg_password" {
  stack_id = spacelift_stack.ec2-stack.id
  command = "terraform destroy -auto-approve"
  every   = ["0 8 ? * 6"]
}

resource "spacelift_policy" "no-weekend-deploys" {
  name = "Let's not deploy any changes over the weekend"
  body = file("${path.module}/test.rego")
  type = "PLAN"
}

output "dummy" {
  value = "dummychange"
}

variable "new_worker_pool_id" {}

locals {
  map = {
    foo = "bar"
  }
  list = []
}

resource "spacelift_environment_variable" "list_example" {
  name       = "list_example"
  value      = jsonencode(local.list)
  write_only = false
}
