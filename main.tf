resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  space_id        = "legacy"
  terraform_version = "1.5.2"
}

resource "spacelift_scheduled_task" "rotate_app_reg_password" {
  stack_id = spacelift_stack.ec2-stack.id
  command = "terraform destroy -auto-approve"
}
