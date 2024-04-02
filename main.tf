
resource "spacelift_environment_variable" "test" {
  context_id = "prod-k8s-ie"
  name       = "KUBECONFIG"
  value      = "test"
  write_only = false
}
