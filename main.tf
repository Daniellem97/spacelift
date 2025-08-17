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
  source  = "GoogleCloudPlatform/cloudsql/postgresql"
  version = "~> 6.0"

  project         = data.terraform_remote_state.debugtest.outputs.projects.test2.id
  region          = "us-central1"
  database_version = "POSTGRES_13"
  
  name            = "test-instance"
  database_names = [
    "test-db"
  ]
}
