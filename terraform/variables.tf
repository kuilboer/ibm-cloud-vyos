variable vyos_resource_group_name {
  type        = string
  default     = "default"
  description = "What is the name of the existing resource domain the resources should be created under:"
}

variable ibmcloud_region {
  type        = string
  description = "To which region do you plan to deploy"
}

variable ibmcloud_api_key {
  type        = string
  description = "Enter your IBM Cloud API-key"
}

variable deployment_vpc {
  type        = string
  description = "Name the existing VPC where the appliance is to be deployed:"
}

variable subnet_mgmt_name {
  type        = string
  description = "The name of the existing management subnet"
}

variable subnet_north_name {
  type        = string
  description = "The name of the existing north subnet"
}

variable subnet_south_name {
  type        = string
  description = "The name of the existing south subnet"
}

# Image variables
variable vyos_image_cos_instance_name {
  type        = string
  description = "The name of the COS instance where the image's target bucket resides"
}

variable vyos_image_cos_bucket_name {
  type        = string
  description = "THe name of the COS bucket where the image should be uploaded"
}


# Instance variables

variable vyos_host_name {
    type      = string
    description = "The hostname for the new vyos gateway (cluster)"
}

variable instance_profile_name {
  type          = string
  description   = "What VSIprofile to use for the new appliance e.g. cx2-2x4"
}

variable vyos_management_ip {
    type        = string
    description = "Vyos instance management ip-address"
}


variable vyos_ssh_key {
  type        = string
  description = "Which existing vpc ssh-key should be configured in the image."
}