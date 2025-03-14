resource "spacelift_stack" "example_stack" {
 github_enterprise {
    id = "github-enterprise-default-integration"
    namespace = "Daniellem97"
  }
  name        = "example-stack"
  repository  = "securitygroups"
  branch      = "main"
  space_id    = "testnoinheritance-01J82YD2J1E8BRQAR8E1WS3075"
  github_action_deploy = false
  description = "An example Spacelift stack"
}

resource "aws_s3_bucket" "example" {
  bucket = "ewoifh0ehf0pqf"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
