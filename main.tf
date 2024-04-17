resource "spacelift_stack" "backend" {
  name = "myproject_production_1-0_backend"
  branch            = "main"
  space_id          = "root"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}

resource "spacelift_stack" "frontend" {
  name       = "myproject_production_1-0_frontend"
  branch            = "main"
  space_id          = "root"
  description       = "change"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}

resource "spacelift_stack" "frontend2" {
  name       = "myproject_production_1-0_frontend2"
  branch            = "main"
  space_id          = "root"
  description       = "change"
  project_root      = "cluster"
  repository        = "tftest"
  terraform_version = "1.3.0"

}

variable "SP_CT" {
  default = {
    SPACE_FAMILY   = "myproject"
    SPACE_NAME     = "production"
    SPACE_VERSION  = "1-0"
  }
}

variable "DEPENDENCIES" {
  default = [
    {
      Src = {
        StackName = "backend"
      }
      Dst = {
        StackName = "frontend"
      }
    }
  ]
}

locals {
  STACK-DEP = distinct([for v in var.DEPENDENCIES : {
    "SrcShort" = v["Src"]["StackName"],
    "DstShort" = v["Dst"]["StackName"],
    "Src"      = lower(join("_", [var.SP_CT.SPACE_FAMILY, var.SP_CT.SPACE_NAME, replace(var.SP_CT.SPACE_VERSION, ".", "-"), v["Src"]["StackName"]])),
    "Dst"      = lower(join("_", [var.SP_CT.SPACE_FAMILY, var.SP_CT.SPACE_NAME, replace(var.SP_CT.SPACE_VERSION, ".", "-"), v["Dst"]["StackName"]])),
  }])
}

resource "null_resource" "delay" {
  triggers = {
    "before" = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "sleep 60"  # Sleeps for 60 seconds
  }
}

resource "spacelift_stack_dependency" "stack-dep" {
  for_each            = { for k, v in local.STACK-DEP : k => v }
  depends_on_stack_id = each.value["Src"]
  stack_id            = each.value["Dst"]

  depends_on = [null_resource.delay]
}
