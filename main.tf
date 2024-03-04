resource "spacelift_space" "development" {
  name = "development"

  # Every account has a root space that serves as the root for the space tree.
  # Except for the root space, all the other spaces must define their parents.
  parent_space_id = "root"

  # An optional description of a space.
  description = "This a child of the root space. It contains all the resources common to the development infrastructure."
}

# Fetch details of the default GitHub Enterprise integration
data "spacelift_github_enterprise_integration" "this" {
  id = "legacy-test" # Optional: Specify the integration ID if not using the default
}

# Define the stack in Spacelift
resource "spacelift_stack" "metabase_test" {
  name              = "metabase-test"
  repository        = "tftest"
  branch            = "main"
  project_root      = "path/to/metabase"
  terraform_version = "1.5.7"
  space_id = "legacy"
  # GitHub Enterprise settings for the stack
  github_enterprise {
    namespace = "Daniellem97" # The GitHub organization or user the repository belongs to
    id = data.spacelift_github_enterprise_integration.this.id
  }
}
