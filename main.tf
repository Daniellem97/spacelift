# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
 github_enterprise {
    namespace = "Daniellem97"
  }
  name        = "example-stack1"
  repository  = "securitygroups"
  branch      = "main"
  description = "An example Spacelift stack"
}

resource "spacelift_context" "prod-k8s-ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
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
