resource "spacelift_idp_group_mapping" "test" {

  name = "testingsl1"
  policy {
    space_id = "root"
    role     = "READ"
  }
}

resource "spacelift_stack_dependency" "test" {
  stack_id            = "debugtest"
  depends_on_stack_id = "demo-stack"
}
