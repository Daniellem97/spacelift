
resource "spacelift_policy" "trigger_only_stacks_project_root" {
  name     = "trigger only stacks project root"
  type     = "GIT_PUSH" 
  body     = file("test.rego")
  space_id = "root"  # or whatever space ID you use
}

import {
  to = spacelift_policy.trigger_only_stacks_project_root
  id = "trigger-only-stacks-project-root"
}

resource "spacelift_module" "k8s-module" {
  name               = "k8s-module"
  terraform_provider = "aws"
  administrative     = true
  branch             = "main"
  description        = "Infra terraform module"
  repository         = "testmultimodule"
  project_root       = "pet"
  public             = "true"
}

resource "spacelift_idp_group_mapping" "test" {
  name = "test"
  policy {
    space_id = "root"
    role     = "ADMIN"
  }
  description = "test description"
}
