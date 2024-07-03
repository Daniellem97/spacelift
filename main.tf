# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
  name        = "example-stack1"
  repository  = "tftest"
  branch      = "main"
  description = "An example Spacelift stack"
}

