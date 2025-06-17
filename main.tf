resource "spacelift_mounted_file" "ireland-kubeconfig" {
  context_id    = spacelift_context.prod_k8s_ie.id
  relative_path = "source/terraform.auto.tfvars"
  content = base64encode("environment = \"whatever\"")
  write_only = false
}

resource "spacelift_stack" "testtg" {
  name = "testtg"
  space_id = "root"

  namespace = "Daniellem97"
  repository = "AddressBook"
  branch = "master"

  terragrunt {
    terraform_version = "1.5.7"
    terragrunt_version = "0.73.8"
    tool = "TERRAFORM_FOSS"
    use_run_all = false
    use_smart_sanitization = true
  }

  enable_well_known_secret_masking = true
  github_action_deploy = false
}

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
