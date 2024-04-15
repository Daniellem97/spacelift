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

locals {
  STACK-DEP = {
    "infra_depends_on_app1" = {
      Src = spacelift_stack.infra.id
      DST = spacelift_stack.app1.id
    }
  }
}

resource "spacelift_stack_dependency" "stack-dep" {
  for_each            = { for k, v in local.STACK-DEP : k => v }
  depends_on_stack_id = each.value["Src"]
  stack_id            = each.value["DST"]
}
