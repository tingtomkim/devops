resource "aws_eks_node_group" "infra" {
  count		  = var.create_nodegroup_infra ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-infra-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_infra_instance_types]
  disk_size       = var.nodegroup_infra_disk_size

  labels = {
    nodegroup-name = "infra-ng" 
    nodegroupname = "infra-ng"
  }
  
  tags = {
    Name = "infra-ng"
  }

  scaling_config {
    desired_size = var.nodegroup_infra_scaling_config_desired_size
    max_size     = var.nodegroup_infra_scaling_config_max_size
    min_size     = var.nodegroup_infra_scaling_config_min_size
  }
}

resource "aws_eks_node_group" "app" {
  count		  = var.create_nodegroup_app ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-app-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_app_instance_types]
  disk_size       = var.nodegroup_app_disk_size

  labels = {
    nodegroup-name = "app-ng"
    nodegroupname = "app-ng"    
  }

  tags = {
    Name = "app-ng"
  }
  
  scaling_config {
    desired_size = var.nodegroup_app_scaling_config_desired_size
    max_size     = var.nodegroup_app_scaling_config_max_size
    min_size     = var.nodegroup_app_scaling_config_min_size
  }
}

resource "aws_eks_node_group" "test" {
  count		  = var.create_nodegroup_test ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-test-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_test_instance_types]
  disk_size       = var.nodegroup_test_disk_size

  labels = {
    nodegroupname = "test-ng"
  }

  tags = {
    Name = "test-ng"
  }  
  
  scaling_config {
    desired_size = var.nodegroup_test_scaling_config_desired_size
    max_size     = var.nodegroup_test_scaling_config_max_size
    min_size     = var.nodegroup_test_scaling_config_min_size
  }
}


resource "aws_eks_node_group" "infra_spot" {
  count           = var.create_nodegroup_infra_spot ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-infra-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  capacity_type   = "SPOT"
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_infra_instance_types]
  disk_size       = var.nodegroup_infra_disk_size

  labels = {
    nodegroup-name = "infra-ng"
    nodegroupname = "infra-ng"
  }

  tags = {
    Name = "infra-ng"
  }

  scaling_config {
    desired_size = var.nodegroup_infra_scaling_config_desired_size
    max_size     = var.nodegroup_infra_scaling_config_max_size
    min_size     = var.nodegroup_infra_scaling_config_min_size
  }
}

resource "aws_eks_node_group" "app_spot" {
  count           = var.create_nodegroup_app_spot ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-app-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  capacity_type   = "SPOT"
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_app_instance_types]
  disk_size       = var.nodegroup_app_disk_size

  labels = {
    nodegroup-name = "app-ng"
    nodegroupname = "app-ng"
  }

  tags = {
    Name = "app-ng"
  }

  scaling_config {
    desired_size = var.nodegroup_app_scaling_config_desired_size
    max_size     = var.nodegroup_app_scaling_config_max_size
    min_size     = var.nodegroup_app_scaling_config_min_size
  }
}

resource "aws_eks_node_group" "runner_spot" {
  count           = var.create_nodegroup_runner_spot ? 1 : 0
  cluster_name    = aws_eks_cluster.this.name
  node_group_name = "${var.name}-runner-node-group"
  node_role_arn   = aws_iam_role.node_group.arn
  capacity_type   = "SPOT"
  subnet_ids      = var.subnet_ids
  instance_types  = [var.nodegroup_runner_instance_types]
  disk_size       = var.nodegroup_runner_disk_size

  labels = {
    nodegroup-name = "runner-ng"
    nodegroupname = "runner-ng"
  }
  tags = {
    Name = "runner-ng"
  }
  scaling_config {
    desired_size = var.nodegroup_runner_scaling_config_desired_size
    max_size     = var.nodegroup_runner_scaling_config_max_size
    min_size     = var.nodegroup_runner_scaling_config_min_size
  }
}
