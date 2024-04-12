resource "spacelift_stack" "infra" {
  branch     = "main"
  name       = "tftest"
  repository = "tftest"
}


resource "spacelift_stack" "app" {
  branch     = "main"
  name       = "tftest"
  repository = "tftest"
}

resource "spacelift_stack_dependency" "test" {
  stack_id            = spacelift_stack.app.id
  depends_on_stack_id = spacelift_stack.infra.id
}
