variable "name" {}

variable "subnet_ids" {}

variable "vpc_id" {}

variable "vpc_cidr" {}

variable "endpoint_public_access" {}


### nodegroup_infra ###
variable "create_nodegroup_infra" {
  default = "false"
}
variable "create_nodegroup_infra_spot" {
  default = "false"
}
variable "nodegroup_infra_instance_types" {
  default = "t2.small"
}
variable "nodegroup_infra_disk_size" {
  default = "50"
}
variable "nodegroup_infra_scaling_config_desired_size" {
  default = "0"
}
variable "nodegroup_infra_scaling_config_max_size" {
  default = "1"
}
variable "nodegroup_infra_scaling_config_min_size" {
  default = "0"
}


### nodegroup_app ###
variable "create_nodegroup_app" {
  default = "false"
}
variable "create_nodegroup_app_spot" {
  default = "false"
}
variable "nodegroup_app_instance_types" {
  default = "t2.small"
}
variable "nodegroup_app_disk_size" {
  default = "50"
}
variable "nodegroup_app_scaling_config_desired_size" {
  default = "0"
}
variable "nodegroup_app_scaling_config_max_size" {
  default = "1"
}
variable "nodegroup_app_scaling_config_min_size" {
  default = "0"
}


### nodegroup_test ###
variable "create_nodegroup_test" {
  default = "false"
}
variable "nodegroup_test_instance_types" {
  default = "t2.small"
}
variable "nodegroup_test_disk_size" {
  default = "50"
}
variable "nodegroup_test_scaling_config_desired_size" {
  default = "0"
}
variable "nodegroup_test_scaling_config_max_size" {
  default = "1"
}
variable "nodegroup_test_scaling_config_min_size" {
  default = "0"
}

### nodegroup_runner ###
variable "create_nodegroup_runner" {
  default = "false"
}
variable "create_nodegroup_runner_spot" {
  default = "false"
}
variable "nodegroup_runner_instance_types" {
  default = "t2.small"
}
variable "nodegroup_runner_disk_size" {
  default = "50"
}
variable "nodegroup_runner_scaling_config_desired_size" {
  default = "1"
}
variable "nodegroup_runner_scaling_config_max_size" {
  default = "2"
}
variable "nodegroup_runner_scaling_config_min_size" {
  default = "1"
}


### EKS Version ###
variable "eks_version" {
  default = "1.27"
}

