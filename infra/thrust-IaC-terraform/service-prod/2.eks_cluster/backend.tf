terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "2_service-prod-eks"
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
