
# Spacelift Stack Definition
resource "spacelift_stack" "example_stack" {
  name             = "example-stack-1-worker"
  repository       = "tftest"
  branch           = "main"
  terraform_version = "1.5.0"
  # Auto-deploy on changes
  autodeploy = true
  # Description
  description = "An example Spacelift stack with a destructor attached."
}
