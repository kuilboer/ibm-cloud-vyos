data "ibm_is_instance_profile" "vyos" {
  name = var.instance_profile_name
}

data "ibm_is_vpc" "vyos" {
  name = var.deployment_vpc
}