resource "spacelift_stack" "example_stack2" {
  github_enterprise {
    namespace = "Daniellem97"
  }

  name                     = "example-stack"
  repository               = "securitygroups"
  branch                   = "main"
  github_action_deploy     = false
  description              = "An example Spacelift stack"
}

resource "spacelift_stack_destructor" "example_stack_destructor" {
  stack_id      = spacelift_stack.example_stack2.id
}
