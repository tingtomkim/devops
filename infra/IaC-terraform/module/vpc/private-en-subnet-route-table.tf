resource "aws_route_table" "private_en" {
#  count = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0

  vpc_id = aws_vpc.this.id

  tags = {
#    Name = "private-en-route-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-en-private-${substr(var.availability_zones[count.index], -2, -1 )}-rt"
  }
}

resource "aws_route_table_association" "private_en" {
#  count = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0

  route_table_id = aws_route_table.private_en[count.index].id
  subnet_id      = aws_subnet.private_en[count.index].id
}

resource "aws_route" "private_en" {
#  count = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0

  route_table_id         = aws_route_table.private_en[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat_en[count.index].id
}
