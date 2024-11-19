# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    namespace = "Daniellem97"
  }
  name        = "example-stack"
  repository  = "securitygroups"
  branch      = "main"
  space_id    = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  github_action_deploy = false
  description = "An example Spacelift stack"
}

resource "spacelift_stasadack" "ansible_tableau_update_os" {
  ansible {
    playbook = "output.tf"
  }
  github_enterprise {
    namespace = "Daniellem97"
  }
  name        = "example-stack"
  autodeploy   = false
  branch       = "main"
  space_id    = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  repository   = "securitygroups"
}
