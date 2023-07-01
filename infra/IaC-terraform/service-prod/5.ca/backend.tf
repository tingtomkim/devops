terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "5_service-prod-cluster-autoscaler"
    }
  }
}
