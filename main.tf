resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
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
