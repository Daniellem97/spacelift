
resource "spacelift_environment_variable" "test" {
  stack_id = "danielle-test"
  name       = "KUBECONFIG"
  value      = "test"
  write_only = false
}
