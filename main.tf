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
  name = "Let's not deploy any changes over the weekend"
  body = file("./policies/login.rego")
  type = "LOGIN"
}

