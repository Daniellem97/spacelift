resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
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
