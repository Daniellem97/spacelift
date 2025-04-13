resource "spacelift_space" "development" {
  name = "development3"
  parent_space_id = "root"
}

resource "google_sql_database_instance" "default" {
  name             = "test-instance"
  database_version = "POSTGRES_13"
  region           = "us-central1"
  project          = data.terraform_remote_state.debugtest.outputs.projects.name1_test2.id

  settings {
    tier = "db-f1-micro"
  }
}

