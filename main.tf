resource "spacelift_space" "development" {
  name = "development"
  parent_space_id = "root"
}

resource "aws_s3_bucket" "example" {
  bucket = "ewoifh0ehf0pqf"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
