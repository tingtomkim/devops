resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
#    Name = "igw-${var.vpc_name}"
    Name = "${var.vpc_name}-igw"
  }
}
