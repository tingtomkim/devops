resource "aws_subnet" "private_eks" {
#  count = length(var.availability_zones)
  count = var.create_eks ? length(var.availability_zones) : 0

  // vpc : 10.x.0.0/16
  // - subnets : 10.x.64.0/20, 10.x.80.0/20, 10.x.96.0/20
#  cidr_block = cidrsubnet(var.cidr_block, 4, 4 + count.index)
  cidr_block = element(concat(var.eks_subnets, [""]), count.index)  
  vpc_id     = aws_vpc.this.id

  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
#    Name = "private-eks-subnet-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-eks-privatezone-${substr(var.availability_zones[count.index], -2, -1 )}"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
