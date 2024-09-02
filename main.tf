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
  description = "Configuration details for the compute cluster in modifying🇮🇪"
  name        = "Production clusters (Ireland)"
}

resource "spacelift_environment_variable" "ireland-kubeconfig" {
  context_id  = "prod-k8s-ie"
  name        = "KUBECONFIG"
  value       = "/project/spacelift/kubeconfig"
  write_only  = false
  description = "Kubeconfig for Ireland Kubernetes cluster"
}

