resource "spacelift_stack" "k8s-cluster" {
  branch            = "main"
  repository        = "tftest"
}
