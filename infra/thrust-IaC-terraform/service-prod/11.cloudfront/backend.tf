terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "11_service-prod-cloudfront"
    }
  }
}
