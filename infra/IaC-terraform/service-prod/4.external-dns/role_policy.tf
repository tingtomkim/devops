module "eks" {
  source = "../../module/external-dns"

  role_name		= "external-dns-role"
  role_policy_file	= "${file("json/external-dns_role.json")}"
 
  policy_name		= "external-dns-policy"
  policy_file		= "${file("json/external-dns_policy.json")}"
}
