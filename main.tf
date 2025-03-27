locals {
  modules = csvdecode(file("${path.module}/terraform_modules.csv"))
}

resource "spacelift_module" "from_csv" {
  for_each = {
    for module in local.modules : module.module_name => module
    if module.spacelift_module_required == "true"
  }

  name        = each.value.module_name
  description = "Terraform module for ${each.value.project}"

  # Optional fields depending on your setup
  repository = each.value.repository_creation_required == "true" ? each.value.module_name : null

  # Add other optional fields if necessary
  labels = [each.value.project]
}
