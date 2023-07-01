module "eks" {
  source = "../../module/ca"

  role_name = "AmazonEKSClusterAutoscalerRole"
  role_policy_file = "${file("json/cluster-autoscaler-role-trust-policy.json")}"

  policy_name = "AmazonEKSClusterAutoscalerPolicy"
  policy_file = "${file("json/cluster-autoscaler-policy.json")}"
}
