terraform {
  required_providers {
    spacelift = {
      source  = "spacelift.io/spacelift-io/spacelift"
      version = "1.19.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

provider "spacelift" {}
