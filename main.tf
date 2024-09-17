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

data "terraform_remote_state" "debugtest" {
  backend = "remote"

  config = {
    hostname     = "spacelift.io"
    organization = "daniellem97"

    workspaces = {
      name = "debugtest"
    }
  }
}

output "name1_test2_id" {
  value = data.terraform_remote_state.debugtest.outputs.projects.name1_test2.id
}

output "name1_test3_number" {
  value = data.terraform_remote_state.debugtest.outputs.projects.name1_test3.number
}
