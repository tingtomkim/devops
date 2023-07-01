output "vpc_id" {
  value = aws_vpc.this.id
}

output "vpc_cidr" {
  value = aws_vpc.this.cidr_block
}

output "public_subnet" {
  value = aws_subnet.public
}

output "public_subnet_map" {
  value = {
    for index, value in aws_subnet.public:
    index  => value.id
  }
}

output "private_en_subnet_map" {
  value = {
    for index, value in aws_subnet.private_en:
    index  => value.id
  }
}

output "private_eks_subnet_map" {
  value = {
    for index, value in aws_subnet.private_eks:
    index  => value.id
  }
}

output "private_db_subnet_map" {
  value = {
    for index, value in aws_subnet.private_db:
    index  => value.id
  }
}

output "private2_subnet_map" {
  value = {
    for index, value in aws_subnet.private2:
    index  => value.id
  }
}

output "private1_subnet_map" {
  value = {
    for index, value in aws_subnet.private1:
    index  => value.id
  }
}
