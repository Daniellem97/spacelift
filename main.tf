resource "spacelift_stack" "this" {
  branch                  = "main"
  name                    = "that"
  repository              = "tftest"
  space_id                = "root"
  terraform_version       = "1.6.2"
  terraform_workflow_tool = "OPEN_TOFU"

  labels = [
    "feature:add_plan_pr_comment"
  ]
}
