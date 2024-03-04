resource "spacelift_space" "development" {
  name = "development"

  # Every account has a root space that serves as the root for the space tree.
  # Except for the root space, all the other spaces must define their parents.
  parent_space_id = "root"

  # An optional description of a space.
  description = "This a child of the root space. It contains all the resources common to the development infrastructure."
}

resource "random_password" "password_1" {
  length  = 20
  special = true
}

# Fetch details of the GitHub integration
data "spacelift_github_integration" "this" {
  integration_id = "legacy-test"
}

# Define the stack in Spacelift
resource "spacelift_stack" "metabase_test" {
  # Use the GitHub integration ID for the VCS provider
  vcs_provider_id    = data.spacelift_github_integration.this.id
  branch             = "main" # The default branch of your repository
  description        = "Stack for the Metabase Test project"
  name               = "metabase-test"
  project_root       = "path/to/metabase" # Specify the directory in your repo that contains the Terraform configuration
  repository   = "tftest"
  space_id        = "legacy"  
  terraform_version  = "1.5.7" # Specify the Terraform version, e.g., "0.14.5"
}
