resource "spacelift_stack" "spacelift" {
name = "spacelift"
space_id = "root"
repository = "tftest"
branch = "main"

terraform_workflow_tool = "CUSTOM"
terraform_smart_sanitization = true

description = "The administrative spacelift stack, which manages our spacelift resources."
labels = ["folder:Infrastructure", "kind:meta", "sensitive"]
administrative = true
enable_well_known_secret_masking = true
github_action_deploy = false
}

resource "aws_s3_bucket" "example" {
  bucket = "ewoifh0ehf0pqf"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
