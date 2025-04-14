resource "spacelift_mounted_file" "ireland-kubeconfig" {
  context_id    = "prod-k8s-ie"
  relative_path = "/terraform.tfvars"
  content = <<EOT
aws_region = "us_west_1"
EOT
  write_only = false
}

resource "spacelift_context" "prod-k8s-ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
  labels       = ["autoattach:aws"]
}
