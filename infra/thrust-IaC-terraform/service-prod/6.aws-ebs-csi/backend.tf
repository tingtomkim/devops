terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "6_service-prod-aws-ebs-csi"
    }
  }
}
