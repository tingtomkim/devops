module "eks" {
  source = "../../module/aws-efs-csi"

  role_name = "AmazonEKS_EFS_CSI_DriverRole"
  role_policy_file = "${file("json/aws-efs-csi-driver-trust-policy.json")}"

  policy_name = "AmazonEKS_EFS_CSI_Driver_Policy"
  policy_file = "${file("json/aws-efs-csi-driver-policy.json")}"
}
