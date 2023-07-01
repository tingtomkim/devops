terraform {
  backend "remote" {
    organization = "service-prod"

    workspaces {
      name = "4_service-prod-external-dns"
    }
  }
}
