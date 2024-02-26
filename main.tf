resource "spacelift_idp_group_mapping" "test" {

  name = "testingsl1"
  policy {
    space_id = "root"
    role     = "READ"
  }
}


resource "spacelift_stack" "frontdoor_dev_02_routing" {
  # GitHub custom app
  github_enterprise {
    namespace = "Daniellem97"
  }

  name       = "frontdoor/dev/02_routing"
  autodeploy = true
  space_id   = "root"

  # Source code
  repository                   = "tftest"
  project_root                 = "dev/02_routing"
  branch                       = "main"
  description                  = "Stack for Frontdoor's dev/02_routing resources"

}
resource "spacelift_space" "development" {
  name = "development"

  # Every account has a root space that serves as the root for the space tree.
  # Except for the root space, all the other spaces must define their parents.
  parent_space_id = "root"

  # An optional description of a space.
  description = "This a child of the root space. It contains all the resources common to the development infrastructure."
}
