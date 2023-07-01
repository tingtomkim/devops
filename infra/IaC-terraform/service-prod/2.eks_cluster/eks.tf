locals {
  vpc_id = data.terraform_remote_state.vpc.outputs.vpc_id
  vpc_cidr = data.terraform_remote_state.vpc.outputs.vpc_cidr
  subnet_ids = data.terraform_remote_state.vpc.outputs.subnet_map["private"]["eks"]
}

module "eks" {
  source = "../../module/eks/"

  name                   = "service-prod-eks"
  subnet_ids             = local.subnet_ids
  vpc_cidr               = local.vpc_cidr
  vpc_id                 = local.vpc_id
  endpoint_public_access = true

  create_nodegroup_infra                      = true
  nodegroup_infra_instance_types              = "t3a.xlarge"
  nodegroup_infra_disk_size                   = 50
  nodegroup_infra_scaling_config_desired_size = "2"
  nodegroup_infra_scaling_config_max_size     = "2"
  nodegroup_infra_scaling_config_min_size     = "2"

  create_nodegroup_app                      = true
  nodegroup_app_instance_types              = "t3a.xlarge"
  nodegroup_app_disk_size                   = 50
  nodegroup_app_scaling_config_desired_size = "2"
  nodegroup_app_scaling_config_max_size     = "2"
  nodegroup_app_scaling_config_min_size     = "2"

}
