resource "spacelift_stack" "k8s_cluster2" {
  administrative    = true
  autodeploy        = true
  branch            = "master"
  description       = "Provisions a Kubernetes cluster"
  name              = "Kubernetes Cluster"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"
}

resource "spacelift_environment_variable" "credentials" {
  stack_id   = spacelift_stack.k8s_cluster2.id
  name       = "AWS_CREDENTIALS"
  value      = "REDACTED"
  write_only = true
}

resource "spacelift_stack_destructor" "k8s_cluster_destructor" {
  depends_on = [
    spacelift_environment_variable.credentials,
  ]

  stack_id = spacelift_stack.k8s_cluster2.id
}
