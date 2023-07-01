output "eks_control_plane" {
  value = aws_eks_cluster.this
}

output "eks_sg" {
  value = aws_eks_cluster.this.vpc_config[0].cluster_security_group_id
}

output "eks_oidc" {
  value = aws_iam_openid_connect_provider.this
}
