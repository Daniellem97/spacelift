resource "spacelift_stack" "testterragrunt" {
  terragrunt {
    terraform_version      = "1.7.2"
    terragrunt_version     = "0.59.6"
    use_run_all            = false
    use_smart_sanitization = true
    tool                   = "OPEN_TOFU"
  }

  space_id = "production-01JAWQ7K45F8TDK53CKN6GDV85"
  administrative = true
  branch       = "main"
  name         = "testingname"
  repository   = "terragrunttest"
}
