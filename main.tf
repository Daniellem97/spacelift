# Spacelift Stack Resource
resource "spacelift_stack" "example_stack" {
  name        = "example-stack1"
  repository  = "tftest"
  branch      = "main"
  description = "An example Spacelift stack"
}

resource "aws_db_instance" "example" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.23"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "password123"
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true

  # Setting the certificate authority
  ca_cert_identifier = "rds-ca-2019"

  # Optional settings
  backup_retention_period = 7
  multi_az                = false
  publicly_accessible     = false
  storage_encrypted       = true

  # Add additional settings as needed
  tags = {
    Name = "example-db-instance"
  }
}
