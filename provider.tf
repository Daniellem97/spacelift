terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.8.1"
    }
  }
}

provider "spacelift" {}

terraform {
  required_providers {
    random = {
      source  = "registry.opentofu.org/hashicorp/random"
      version = "3.6.0"
    }
  }
}
