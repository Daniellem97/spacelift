# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    namespace = "Daniellem97"
  }
  name        = "example-stack1"
  repository  = "securitygroups"
  branch      = "main"
  description = "An example Spacelift stack"
}
