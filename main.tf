resource "spacelift_idp_group_mapping" "test" {

  name = "testingsl1"
  policy {
    space_id = "root"
    role     = "READ"
  }
}

resource "spacelift_stack" "infra" {
  branch     = "main"
  name       = "Infrastructure stack"
  repository = "tftest"
}


resource "spacelift_stack" "app" {
  branch     = "main"
  name       = "Application stack"
  repository = "tftest"
}

resource "spacelift_stack_dependency" "test" {
  stack_id            = spacelift_stack.app.id
  depends_on_stack_id = spacelift_stack.infra.id
}

resource "spacelift_stack" "frontdoor_dev_02_routing" {
  # GitHub custom app
  github_enterprise {
    namespace = "Daniellem97"
  }

  name       = "frontdoor/dev/02_routing"
  autodeploy = true
  space_id   = root

  # Source code
  repository                   = "tftest"
  project_root                 = "dev/02_routing"
  branch                       = "main"
  description                  = "Stack for Frontdoor's dev/02_routing resources"

