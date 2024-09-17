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

resource "spacelift_policy" "test_modification" {
  name = data.terraform_remote_state.debugtest.outputs.projects.test1.id
  body = file("./policies/login.rego")
  type = "LOGIN"
}

resource "spacelift_terraform_provider" "provider" {
  # This is the type of your provider.
  type        = "myinternaltool"
  space_id    = "root"
  description = "Explain what this is for"
}
