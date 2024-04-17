resource "spacelift_stack" "backend" {
  name = "myproject_production_1-0_backend"
  branch            = "main"
  space_id          = "root"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}

resource "spacelift_stack" "frontend" {
  name       = "myproject_production_1-0_frontend"
  branch            = "main"
  space_id          = "root"
  description       = "change"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}

resource "spacelift_stack" "frontend2" {
  name       = "myproject_production_1-0_frontend2"
  branch            = "main"
  space_id          = "root"
  description       = "change"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}
