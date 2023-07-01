locals {
  subnet_ids	= data.terraform_remote_state.vpc.outputs.subnet_map["private"]["eks"]
  vpc_id	= data.terraform_remote_state.vpc.outputs.vpc_id
  sg_id		= data.terraform_remote_state.eks.outputs.eks_sg
}

module "eks" {
  source = "../../module/redis/"

##### redis cluster #####
    name                     = "service-prod"
    engine                   = "redis"
    engine_version           = "6.x"
    node_type                = "cache.t3.medium"
    parameter_group_name     = "default.redis6.x"
    port                     = 6379
    num_node_groups          = 1
    replicas_per_node_group  = 1
    automatic_failover_enabled	= true		
    multi_az_enabled		= true		# AZ setting
    snapshot_retention_limit	= 1		# backup

##### redis subnet ######    
    subnet_ids  = local.subnet_ids

##### redis securitygroup ######    
    vpc_id	= local.vpc_id
    sg_id	= local.sg_id
}
