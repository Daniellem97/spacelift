resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
}

provider "google" {
  project     = "data.terraform_remote_state.debugtest.outputs.projects.test1.id"
  region      = "us-central1"
}
