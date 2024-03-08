variable "labels" {
  description = "Map of labels to be converted into a set of strings"
  type        = map(string)
  default     = {
    namespace = "foo-bar"
  }
}

resource "spacelift_module" "this" {
  name       = "terraform-default-multimodule2"
  branch     = "main"
  repository = "testmultimodule"
  labels     = toset([for k, v in var.labels : "${k}=${v}"])
}

