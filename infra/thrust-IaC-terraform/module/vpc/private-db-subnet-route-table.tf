resource "aws_route_table" "private_db" {
  count = var.create_db ? 1 : 0
  vpc_id = aws_vpc.this.id

  tags = {
#    Name = "private-db-subnet-route-table-${var.vpc_name}"
    Name = "${var.vpc_name}-db-private-rt"
  }
}

resource "aws_route_table_association" "private_db" {
#  count = length(var.availability_zones)
   count = var.create_db ? length(var.availability_zones) : 0

#  route_table_id = aws_route_table.private_db.id
  route_table_id = aws_route_table.private_db[count.index].id
  subnet_id      = aws_subnet.private_db[count.index].id
}
