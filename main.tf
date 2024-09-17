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

resource "spacelift_terraform_provider" "provider" {
  # This is the type of your provider.
  type        = "myinternaltool"
  space_id    = "root"
  description = "Explain what this is for"
}
