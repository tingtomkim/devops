terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "7_service-prod-aws-efs-csi"
    }
  }
}
