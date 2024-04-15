resource "spacelift_stack" "infra" {
  branch     = "main"
  name       = "tftest"
  repository = "tftest"
}


resource "spacelift_stack" "app1" {
  branch     = "main"
  name       = "tftest1"
  repository = "tftest"
}

resource "spacelift_stack_dependency" "test" {
  stack_id            = spacelift_stack.app1.id
  depends_on_stack_id = spacelift_stack.infra.id
}

resource "spacelift_module" "that" {
  repository            = "terraform-aws-module"
  branch                = "main"
  space_id              = "root"
}

resource "spacelift_stack" "k8s-core-kubernetes" {
  kubernetes {
    namespace       = "core"
    kubectl_version = "1.26.1" # Optional kubectl version
  }

  autodeploy   = true
  branch       = "main"
  description  = "Shared cluster services (Datadog, Istio etc.)"
  name         = "Kubernetes core services"
  project_root = "core-services"
  repository   = "tftest"

  # You can use hooks to authenticate with your cluster
  before_init = ["aws eks update-kubeconfig --region us-east-2 --name k8s-cluster"]
}
