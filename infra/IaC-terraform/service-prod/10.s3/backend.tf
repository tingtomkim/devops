terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "10_service-prod-s3"
    }
  }
}
