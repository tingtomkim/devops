resource "aws_subnet" "private_en" {
#  count = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0

  cidr_block = cidrsubnet(var.cidr_block, 8, 40 + count.index)
  vpc_id     = aws_vpc.this.id

  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
#    Name = "private-en-subnet-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-en-privatezone-${substr(var.availability_zones[count.index], -2, -1 )}"
  }
}
