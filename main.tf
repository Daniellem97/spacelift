resource "spacelift_mounted_file" "ireland-kubeconfig" {
  context_id    = "prod-k8s-ie"
  relative_path = "/terraform.tfvars"
  content = base64encode("aws_region = \"us-east-1\"")
  write_only = false
}

resource "spacelift_context" "prod-k8s-ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
  labels       = ["autoattach:aws"]
before_init = [
    "mkdir -p \"/mnt/workspace/source/$TF_VAR_project_root\"",
    "mv /mnt/workspace/terraform.tfvars \"/mnt/workspace/source/$TF_VAR_project_root/terraform.tfvars\""
  ]
}
