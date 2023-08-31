resource "spacelift_stack" "ec2-stack" {

  autodeploy   = false
  branch       = "main"
  description  = "AWS EC2 Instance and Networking"
  name         = "development-stack"
  repository   = "tftest"
  space_id        = "legacyi"
}

output "spacelift_ec2_stack_space_id" {
  value = spacelift_stack.ec2-stack.space_id
  description = "The space_id of the spacelift_stack ec2-stack"
}
