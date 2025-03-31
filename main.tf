resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
}

resource "spacelift_stack" "stacka" {
  branch     = "master"
  name       = "stacka"
  repository = "addressbook"
}

import {
  id = "stacka"
}
