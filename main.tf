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

resource "spacelift_stack" "ansible_tableau_update_os" {
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

module "cloudsql_postgres" {
  source  = "terraform-google-modules/sql-db/google"
  version = "~> 7.0"

  project         = data.terraform_remote_state.debugtest.outputs.projects.name1_test2.id
  name            = "x"
  database_version = "POSTGRES_13"
  region          = "us-central1"

  settings = {
    tier = "db-f1-micro"
  }

  database_flags = {
    cloudsql.iam_authentication = "on"
  }

  database_names = [
    "x"
  ]
}
