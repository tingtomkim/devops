module "vpc" {
  source = "../../module/vpc/"

  availability_zones = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]  
  cidr_block         = "10.103.0.0/16"
  vpc_name           = "service-prod"
  cluster_name = "service-prod-eks"
  
  # subnet create 
  public_subnets        = ["10.103.1.0/24", "10.103.2.0/24", "10.103.3.0/24"]
  
  create_eks            = "true"
  eks_subnets           = ["10.103.100.0/23", "10.103.102.0/23", "10.103.104.0/23"]
  
  create_private1       = "true"
  private1_subnets	= ["10.103.201.0/24", "10.103.202.0/24", "10.103.203.0/24"]
  
  create_private2       = "false"
  create_en             = "false"
  create_db             = "false"
}
