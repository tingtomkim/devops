resource "aws_security_group" "redis" {
  name   = "${var.name}-redis-sg"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags          = {
    Name = "${var.name}-redis-sg"
  }
}

resource "aws_security_group_rule" "inbound1" {
  security_group_id = aws_security_group.redis.id
  type              = "ingress"
  source_security_group_id = aws_security_group.redis.id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
}

resource "aws_security_group_rule" "inbound2" {
  security_group_id = aws_security_group.redis.id
  type              = "ingress"
  source_security_group_id = var.sg_id
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
}

resource "aws_security_group_rule" "inbound_office" {
  security_group_id = aws_security_group.redis.id
  type              = "ingress"
  from_port   = 6379
  to_port     = 6379
  cidr_blocks = ["172.28.0.0/21"]
  protocol    = "TCP"
}
