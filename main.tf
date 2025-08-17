resource "spacelift_stack" "spacelift" {
name = "spacelift"
space_id = "root"
repository = "tftest"
branch = "main"

terraform_workflow_tool = "CUSTOM"
terraform_smart_sanitization = true

description = "The administrative spacelift stack, which manages our spacelift resources."
labels = ["folder:Infrastructure", "kind:meta", "sensitive"]
administrative = true
enable_well_known_secret_masking = true
github_action_deploy = false
}

resource "spacelift_stack" "this" {
 github_enterprise {
    namespace = "Daniellem97"
  }

branch = "main"
name = "labelsdebug"
repository = "securitygroups"
labels = var.spacelift_stack_labels
}

variable "spacelift_stack_labels" {
description = "Stacks labels"
type = set(string)
}
