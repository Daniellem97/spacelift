resource "spacelift_stack" "terragrunt-stack" {
  terragrunt {
    terraform_version      = "1.6.2"
    terragrunt_version     = "0.55.15"
    use_run_all            = false
    use_smart_sanitization = true
    tool                   = "OPEN_TOFU"
  }
  autodeploy   = true
  branch       = "main"
  name         = "Terragrunt stack example"
  description  = "Deploys infra using Terragrunt"
  repository   = "terragrunt-stacks"
  project_root = "path/to/terragrunt_hcl"
}
