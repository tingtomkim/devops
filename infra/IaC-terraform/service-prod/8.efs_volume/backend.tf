terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "8_service-prod-efs-volume"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "remote"

  config = {
    organization = "service-prod"
    workspaces = {
      name = "1_service-prod-vpc"
    }
  }
}

data "terraform_remote_state" "eks" {
  backend = "remote"

  config = {
    organization = "service-prod"
    workspaces = {
      name = "2_service-prod-eks"
    }
  }
}
