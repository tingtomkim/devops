variable "cidr_block" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "availability_zones" {
  type = list
}

variable "cluster_name" {}

variable "create_private1" {}
variable "create_private2" {}
variable "create_en" {}
variable "create_eks" {}
variable "create_db" {}

variable "public_subnets" {}
variable "eks_subnets" {}
variable "private1_subnets" {}
