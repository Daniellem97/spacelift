resource "spacelift_stack" "k8s_cluster9" {
  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Provisions a Kubernetes cluster"
  name              = "Kubernetes Cluster 2"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.3"
}

resource "spacelift_stack" "k8s_cluster3" {
  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Provisions a Kubernetes cluster"
  name              = "Kubernetes Cluster 3 "
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.3"
}

resource "spacelift_stack" "k8s_cluster4" {
  administrative    = true
  autodeploy        = true
  branch            = "main"
  description       = "Provisions a Kubernetes cluster"
  name              = "Kubernetes Cluster 4"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.3"
}

resource "spacelift_environment_variable" "credentials" {
  stack_id   = spacelift_stack.k8s_cluster2.id
  name       = "AWS_CREDENTIALS"
  value      = "REDACTED"
  write_only = true
}
