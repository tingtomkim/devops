locals {
  subnet_ids = data.terraform_remote_state.vpc.outputs.subnet_map["private"]["eks"]
  eks_sg = data.terraform_remote_state.eks.outputs.eks_sg
}

module "airflow" {
  source = "../../module/efs/"

  name                   = "airflow"
  subnet_ids             = local.subnet_ids
  eks_sg		 = local.eks_sg
}

module "dataflow" {
  source = "../../module/efs/"

  name                   = "dataflow"
  subnet_ids             = local.subnet_ids
  eks_sg                 = local.eks_sg
}
