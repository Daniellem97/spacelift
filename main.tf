
resource "spacelift_context" "example" {
  name = "example-context"
  description = "Runs custom script after plan step"

  after_plan = [
    "echo 'Plan just completed!'",
    "cat .terraform/plan.out > /tmp/plan-output.txt",
    "your-custom-script.sh"
  ]
}
