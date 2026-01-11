resource "spacelift_stack" "spacelift" {
name = "spacelift"
space_id = "root"
repository = "tftest"
branch = "main"

terraform_workflow_tool = "CUSTOM"
terraform_smart_sanitization = true

description = "The administrative spacelift stack, which manages our spacelift resources."
labels = ["folder:Infrastructure", "kind:meta", "sensitive"]
administrative = true
enable_well_known_secret_masking = true
github_action_deploy = false
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
