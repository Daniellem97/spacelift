# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
  name        = "example-stack1"
  repository  = "tftest"
  branch      = "main"
  description = "An example Spacelift stack"
}

# AWS S3 Bucket Resource
resource "aws_s3_bucket" "example_bucket1232423" {
  bucket = "example-bucket-unique-name1231231"  # Ensure this name is globally unique
  acl    = "private"

  tags = {
    Name        = "example-bucket"
    Environment = "Dev"
  }
}
