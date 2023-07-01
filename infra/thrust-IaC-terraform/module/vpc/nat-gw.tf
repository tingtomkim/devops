# ############################################################################################
# for private-subnet
# ############################################################################################
resource "aws_eip" "nat" {
  count = length(var.availability_zones)
  vpc   = true
}

resource "aws_nat_gateway" "nat" {
  count         = length(var.availability_zones)
  allocation_id = aws_eip.nat[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
#    Name = "nat-gw-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-${substr(var.availability_zones[count.index], -2, -1 )}-nat-gw"
  }
}

# ############################################################################################
# for private-en-subnet
# ############################################################################################

resource "aws_eip" "nat_en" {
#  count = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0  
  vpc   = true
}

resource "aws_nat_gateway" "nat_en" {
#  count         = length(var.availability_zones)
  count = var.create_en ? length(var.availability_zones) : 0  
  allocation_id = aws_eip.nat_en[count.index].id
  subnet_id     = aws_subnet.public[count.index].id

  tags = {
#    Name = "nat-gw-en-${format("%02d", count.index+1)}-${var.vpc_name}"
    Name = "${var.vpc_name}-en-${substr(var.availability_zones[count.index], -2, -1 )}-nat-gw"
  }
}
