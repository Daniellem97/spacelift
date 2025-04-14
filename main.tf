resource "spacelift_mounted_file" "ireland-kubeconfig" {
  context_id    = spacelift_context.prod_k8s_ie.id
  relative_path = "source/terraform.auto.tfvars"
  content = base64encode("TF_VAR_environment = \"whatever\"")
  write_only = false
}


resource "spacelift_context" "prod_k8s_ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
  labels       = ["autoattach:aws"]
before_init = [
    "mkdir -p \"/mnt/workspace/source/$TF_VAR_spacelift_project_root\"",
    "mv /mnt/workspace/source/terraform.auto.tfvars \"/mnt/workspace/source/$TF_VAR_spacelift_project_root/terraform.auto.tfvars\""
  ]
}
