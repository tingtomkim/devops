module "eks" {
  source = "../../module/alb"

  role_name		= "AmazonEKSLoadBalancerControllerRole"
  role_policy_file	= "${file("json/load-balancer-role-trust-policy.json")}"
 
  policy_name		= "AWSLoadBalancerControllerIAMPolicy"
  policy_file		= "${file("json/iam_policy.json")}"
}
