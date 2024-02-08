terraform {
  required_providers {
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = "1.9.2"
    }
  }
}

provider "spacelift" {}
