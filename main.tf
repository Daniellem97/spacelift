
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

locals {
  spaces_chunk_1 = {
    for i in range(0, 1024) :
    format("space-%04d", i) => "This is space number ${i}"
  }

  spaces_chunk_2 = {
    for i in range(1024, 2048) :
    format("space-%04d", i) => "This is space number ${i}"
  }

  spaces_chunk_3 = {
    for i in range(2048, 3072) :
    format("space-%04d", i) => "This is space number ${i}"
  }

  spaces_chunk_4 = {
    for i in range(3072, 3600) :
    format("space-%04d", i) => "This is space number ${i}"
  }

  spaces = merge(
    local.spaces_chunk_1,
    local.spaces_chunk_2,
    local.spaces_chunk_3,
    local.spaces_chunk_4,
  )
}

resource "spacelift_space" "many_spaces" {
  for_each        = local.spaces
  name            = each.key
  parent_space_id = "root"
  description     = each.value
}
