
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
 policy {
    space_id = "metabasetest-01JPQM3E86ETE2TKCNXVD2MEH1"
    role     = "ADMIN"
  }
}

variable "spaces" {
  type = map(string)
  default = {
    for i in range(3600) :
    format("space-%04d", i) => "This is space number ${i}"
  }
}

resource "spacelift_space" "many_spaces" {
  for_each        = var.spaces
  name            = each.key
  parent_space_id = "root"
  description     = each.value
}
