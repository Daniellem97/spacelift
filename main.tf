resource "spacelift_stack" "this" {
  branch                  = "main"
  administrative          = "true"
  name                    = "that"
  repository              = "tftest"
  terraform_version       = "1.6.1"
  terraform_workflow_tool = "OPEN_TOFU"

  labels = [
    "feature:add_plan_pr_comment"
  ]
}

resource "spacelift_context" "prod-k8s-ie" {
  description = "Configuration details for the compute cluster in 🇮🇪"
  name        = "Production cluster (Ireland)"
}

data "spacelift_context_attachment" "prod-k8s-ie" {
  context_id = "prod-k8s-ie"
  stack_id   = "that"
}
