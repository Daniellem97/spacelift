# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    namespace = "daniellem97"
  }
  name        = "example-stack1"
  repository  = "tftest"
  branch      = "main"
  description = "An example Spacelift stack"
}

