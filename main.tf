resource "spacelift_idp_group_mapping" "test" {

  name = "testingsl1"
  policy {
    space_id = "root"
    role     = "READ"
  }
}

data "spacelift_aws_integration" "testpulic" {
  integration_id = "1H1W12328PM15MNK00G9FHAVV"
}
