# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    namespace = "spacelift" # The GitHub organization / user the repository belongs to
  }
  name        = "example-stack1"
  repository  = "tftest"
  branch      = "main"
  description = "An example Spacelift stack"
}

