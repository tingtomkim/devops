terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "3_service-prod-aws-loadbalancer-controller"
    }
  }
}
