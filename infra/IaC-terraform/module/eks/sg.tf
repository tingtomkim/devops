resource "aws_security_group" "control_plane" {
  name   = "${var.name}-control-plane"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = [var.vpc_cidr]
  }
}

resource "aws_security_group" "infra_node_group" {
  count  = var.create_nodegroup_infra ? 1 : 0
  name   = "${var.name}-infra-node-group"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = [var.vpc_cidr]
  }
}

resource "aws_security_group" "app_node_group" {
  count  = var.create_nodegroup_app ? 1 : 0
  name   = "${var.name}-app-node-group"
  vpc_id = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = [var.vpc_cidr]
  }
}
