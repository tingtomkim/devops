resource "aws_elasticache_replication_group" "example" {
    at_rest_encryption_enabled    = false
    auto_minor_version_upgrade    = true
    automatic_failover_enabled    = var.automatic_failover_enabled
    multi_az_enabled              = var.multi_az_enabled
    snapshot_retention_limit      = var.snapshot_retention_limit
    port                          = 6379

    engine                        = var.engine
    engine_version                = var.engine_version
    node_type                     = var.node_type
    replication_group_id          = var.name	# redis cluster name
    replication_group_description = var.name
    security_group_ids            = [aws_security_group.redis.id] 
    parameter_group_name          = var.parameter_group_name
    subnet_group_name             = aws_elasticache_subnet_group.redis_subnet.name
    tags        = {
      Name = "${var.name}"
    }

    cluster_mode {
        num_node_groups         = var.num_node_groups
        replicas_per_node_group = var.replicas_per_node_group
    }
    transit_encryption_enabled    = true
}

resource "aws_elasticache_subnet_group" "redis_subnet" {
    description = var.name
    name        = "${var.name}-redis-subnet"
    subnet_ids  = var.subnet_ids
    tags        = {
      Name = "${var.name}-redis-subnet"
    }
}
