resource "spacelift_mounted_file" "aws_region_vars" {
  name     = "terraform.tfvars"
  content  = <<EOT
aws_region = "us_west_1"
EOT
  write_only = false
}

resource "spacelift_context" "prod-k8s-ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
  label       = "autoattach:aws"

  mounted_file_ids = [
    spacelift_mounted_file.aws_region_vars.id
  ]

  before_init {
    command = <<EOT
      mkdir -p "/mnt/workspace/source/${TF_VAR_project_root}"
      mv /mnt/workspace/terraform.tfvars "/mnt/workspace/source/${TF_VAR_project_root}/terraform.tfvars"
    EOT
  }
}
