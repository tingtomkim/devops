module "eks" {
  source = "../../module/aws-ebs-csi"

  role_name = "AmazonEKS_EBS_CSI_DriverRole"
  role_policy_file = "${file("json/aws-ebs-csi-driver-trust-policy.json")}"
}
