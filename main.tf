# Spacelift Stack
resource "spacelift_stack" "example_stack" {
  count = var.enabled ? 1 : 0

  github_enterprise {
    namespace = "Daniellem97"
  }

  name                     = "example-stack"
  repository               = "securitygroups"
  branch                   = "main"
  description              = "An example Spacelift stack"

  # Dynamically depend on the destructor during deletion
  depends_on = var.enabled ? [] : [null_resource.ensure_destructor_run]
}

# Spacelift Destructor
resource "spacelift_stack_destructor" "example_stack_destructor" {
  count        = var.enabled ? 0 : 1
  stack_id     = spacelift_stack.example_stack[0].id
}

# Dummy Resource to Enforce Destructor Dependency
resource "null_resource" "ensure_destructor_run" {
  count = var.enabled ? 0 : 1

  depends_on = [
    spacelift_stack_destructor.example_stack_destructor
  ]

  provisioner "local-exec" {
    command = "echo 'Destructor has run and cleaned up resources.'"
  }
}
