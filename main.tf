resource "spacelift_stack" "example_stack" {
  github_enterprise {
    namespace = "Daniellem97"
  }
  name                     = "example-stack"
  repository               = "securitygroups"
  branch                   = "main"
  description              = "An example Spacelift stack"
}

# Spacelift Destructor
resource "spacelift_stack_destructor" "example_stack_destructor" {
  stack_id     = spacelift_stack.example_stack.id
}
