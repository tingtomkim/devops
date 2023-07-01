output "eks_control_plane" {
  value = module.eks.eks_control_plane
}

output "eks_sg" {
  value = module.eks.eks_sg
}

output "eks_oidc" {
  value = module.eks.eks_oidc
}
