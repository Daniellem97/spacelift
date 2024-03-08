variable "labels" {
    namespace = "foo-bar"
  }


resource "spacelift_module" "this" {
  name       = "terraform-default-multimodule2"
  branch     = "main"
  repository = "testmultimodule"
  labels     = toset(values(var.labels))
}
