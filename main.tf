resource "spacelift_stack" "example" {
  name         = "environmentvariablecontext"
  description  = "A stack to show the environment variable priority"
  branch       = "main"
  raw_git {
    url        = "https://github.com/spacelift-io/terraform-provider-spacelift"
    branch     = "main"
  }
}
