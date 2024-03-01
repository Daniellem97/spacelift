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
