resource "aws_subnet" "public" {
  count = length(var.availability_zones)

#  cidr_block = cidrsubnet(var.cidr_block, 9, 10 + count.index)
  cidr_block = element(concat(var.public_subnets, [""]), count.index)  
  vpc_id     = aws_vpc.this.id

  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = true

  tags = {
#    Name = "public-subnet-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-publiczone-${substr(var.availability_zones[count.index], -2, -1 )}"
    "kubernetes.io/role/elb" = 1
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }
}
