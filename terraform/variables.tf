variable ibmcloud_region {
  type        = string
  description = "To which region do you plan to deploy"
}

variable ibmcloud_api_key {
  type        = string
  description = "Enter your IBM Cloud API-key"
}

variable instance_profile_name {
  type        = string
  description = "What VSIprofile to use for the new appliance e.g. cx2-2x4"
}

variable deployment_vpc {
  type        = string
  description = "Name the existing VPC where the appliance is to be deployed:"
}


