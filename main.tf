resource "spacelift_stack" "spacelift" {
name = "spacelift"
space_id = "root"
repository = "tftest"
branch = "main"

terraform_version = "1.5.7"
terraform_workflow_tool = "CUSTOM"
terraform_smart_sanitization = true

description = "The administrative spacelift stack, which manages our spacelift resources."
labels = ["folder:Infrastructure", "kind:meta", "sensitive"]
administrative = true
enable_well_known_secret_masking = true
github_action_deploy = false
before_init = ["export SPACELIFT_STACK_LABELS=$TF_VAR_spacelift_stack_labels", "${TF_VAR_spacelift_workspace_root}/source/.ci/setup.sh"]
}
