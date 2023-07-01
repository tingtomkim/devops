resource "aws_subnet" "private1" {
#  count = length(var.availability_zones)
  count = var.create_private1 ? length(var.availability_zones) : 0

#  cidr_block = cidrsubnet(var.cidr_block, 8, 20 + count.index)
  cidr_block = element(concat(var.private1_subnets, [""]), count.index)
  vpc_id     = aws_vpc.this.id

  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
#    Name = "private-subnet-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-privatezone1-${substr(var.availability_zones[count.index], -2, -1 )}"
    "kubernetes.io/role/internal-elb" = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
