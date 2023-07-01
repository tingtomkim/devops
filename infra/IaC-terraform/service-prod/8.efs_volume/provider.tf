terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.55.0"
    }
  }
  required_version = "= 1.0.4"
}

provider "aws" {
  region              = "ap-southeast-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

variable access_key {}
variable secret_key {}
