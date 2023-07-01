terraform {
  backend "remote" {
    organization = "service-prod"    

    workspaces {
      name = "1_service-prod-vpc"
    }
  }
}
