resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
}

import {
  to = spacelift_stack.stacka§
  id = "stacka"
}

resource "spacelift_stack" "stacka" {
  branch     = "master"
  name       = "stacka"
  repository = "addressbook"
}


