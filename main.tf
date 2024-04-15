resource "spacelift_stack" "infra" {
  branch     = "main"
  name       = "tftest"
  repository = "tftest"
}


resource "spacelift_stack" "app1" {
  branch     = "main"
  name       = "tftest1"
  repository = "tftest"
}

resource "spacelift_stack_dependency" "test" {
 stack_id            = spacelift_stack.app1.id
 depends_on_stack_id = spacelift_stack.infra.id
}

