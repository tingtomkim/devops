output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "subnet_map" {
  value = {
    public = {
      common = [module.vpc.public_subnet_map["0"], module.vpc.public_subnet_map["1"], module.vpc.public_subnet_map["2"]]
    }
    private = {
      eks	= [module.vpc.private_eks_subnet_map["0"], module.vpc.private_eks_subnet_map["1"], module.vpc.private_eks_subnet_map["2"]]
      private1	= [module.vpc.private1_subnet_map["0"], module.vpc.private1_subnet_map["1"], module.vpc.private1_subnet_map["2"]]

#      private2  = [module.vpc.private2_subnet_map["0"], module.vpc.private2_subnet_map["1"], module.vpc.private2_subnet_map["2"]]
#      db  = [module.vpc.private_db_subnet_map["0"], module.vpc.private_db_subnet_map["1"], module.vpc.private_db_subnet_map["2"]]
#      en = [module.vpc.private_en_subnet_map["0"], module.vpc.private_en_subnet_map["1"], module.vpc.private_en_subnet_map["2"]]
    }
  }
}
