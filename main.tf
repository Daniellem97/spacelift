resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
}

provider "google" {
  project     = data.terraform_remote_state.debugtest.outputs.projects.test1.id
  region      = "us-central1"
}

resource "google_sql_database_instance" "default" {
  name             = "test-instance"
  database_version = "POSTGRES_13"
  region           = "us-central1"
  project          = data.terraform_remote_state.debugtest.outputs.projects.test1.id

  settings {
    tier = "db-f1-micro"
  }
}
