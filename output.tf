resource "random_string" "example" {
  length  = 16
  special = false
}

output "random_string_output" {
  description = "A random string"
  value       = random_string.example.result
}


