resource "spacelift_space" "development" {
  name = "development"

  # Every account has a root space that serves as the root for the space tree.
  # Except for the root space, all the other spaces must define their parents.
  parent_space_id = "root"

  # An optional description of a space.
  description = "This a child of the root space. It contains all the resources common to the development infrastructure."
}

resource "spacelift_stack" "example_stack" {
  branch     = "master"
  name       = "Example Stack"
  repository = "tftest"

  // Optional fields for stack configuration
  administrative    = true
  autodeploy        = true
  description       = "Example stack description"
  project_root      = "path/to/your/project"
  terraform_version = "0.14.11"
}
