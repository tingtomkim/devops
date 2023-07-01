resource "aws_db_subnet_group" "this" {
  count = var.create_db ? 1 : 0
  name       = "${replace(var.vpc_name,"_","-")}-db-subnet-group"
  subnet_ids = aws_subnet.private_db[*].id
}
