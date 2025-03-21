resource "spacelift_stack" "example_stack" {
 github_enterprise {
    id = "github-enterprise-default-integration"
    namespace = "Daniellem97"
  }
  name        = "example-stack"
  repository  = "securitygroups"
  branch      = "main"
  space_id    = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  github_action_deploy = false
  description = "An example Spacelift stack"
}

resource "spacelift_context" "test324_context" {
  name        = "Production cluster (Ireland)"
  labels = ["test"]
}

resource "spacelift_context_attachment" "test324_attachment" {
  context_id = "test324_context"
  stack_id   = "example_stack"
}
