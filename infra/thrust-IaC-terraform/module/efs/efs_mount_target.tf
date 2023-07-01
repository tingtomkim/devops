resource "aws_efs_mount_target" "archive" { 
  count			= length(var.subnet_ids)
  file_system_id        = aws_efs_file_system.archive.id
  subnet_id             = var.subnet_ids[count.index]
  security_groups       = [ var.eks_sg ]
}
