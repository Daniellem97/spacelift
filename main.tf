# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    is_default = true
    namespace = "Daniellem97"
  }
  name        = "example-stack1"
  repository  = "securitygroups"
  branch      = "main"
  space_id    = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  description = "An example Spacelift stack"
}
