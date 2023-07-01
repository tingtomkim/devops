resource "aws_subnet" "private_db" {
#  count = length(var.availability_zones)
  count = var.create_db ? 1 : 0

  cidr_block = cidrsubnet(var.cidr_block, 8, 30 + count.index)
  vpc_id     = aws_vpc.this.id

  availability_zone       = var.availability_zones[count.index]
  map_public_ip_on_launch = false

  tags = {
#    Name = "private-db-subnet-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-db-privatezone-${substr(var.availability_zones[count.index], -2, -1 )}"
  }
}
