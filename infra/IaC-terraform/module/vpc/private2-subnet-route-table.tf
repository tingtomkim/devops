resource "aws_route_table" "private2" {
#  count = length(var.availability_zones)
  count = var.create_private2 ? length(var.availability_zones) : 0

  vpc_id = aws_vpc.this.id

  tags = {
#    Name = "private2-route-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-private2-${substr(var.availability_zones[count.index], -2, -1 )}-rt"
  }
}

resource "aws_route_table_association" "private2" {
#  count = length(var.availability_zones)
  count = var.create_private2 ? length(var.availability_zones) : 0

  route_table_id = aws_route_table.private2[count.index].id
  subnet_id      = aws_subnet.private2[count.index].id
}

resource "aws_route" "private2" {
#  count = length(var.availability_zones)
  count = var.create_private2 ? length(var.availability_zones) : 0

  route_table_id         = aws_route_table.private2[count.index].id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[count.index].id
}
