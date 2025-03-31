resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
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
