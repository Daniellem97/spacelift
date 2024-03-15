resource "spacelift_stack" "this" {
  branch                  = "main"
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
  space_id    = "root"
}


resource "spacelift_context_attachment" "attachment" {
  context_id = "production-cluster-ireland"
  stack_id   = "that"
}

data "spacelift_worker_pool" "private" {
  worker_pool_id = "01HNK02PZAPP4YFH4C0JE2J8Y4"
}

resource "spacelift_worker_pool" "private" {
  name        = "worker-pool"
}
