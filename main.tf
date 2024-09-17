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

output "test1_id" {
  value = data.terraform_remote_state.debugtest.outputs.projects.test1.id
}

output "test2_number" {
  value = data.terraform_remote_state.debugtest.outputs.projects.test2.number
}
