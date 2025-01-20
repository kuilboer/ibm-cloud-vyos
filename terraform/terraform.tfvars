# Provider details
ibmcloud_region = "eu-de"
deployment_vpc = "olaf-test-edge-vpc"
vyos_resource_group_name = "geo-oku"

instance_profile_name = "bx2-4x16"

vyos_host_name    = "natgw"
subnet_mgmt_name  = "olaf-test-edge-vpc-zone-2-sn-vyos-management"
subnet_north_name = "olaf-test-edge-vpc-zone-2-sn-vyos-private-frontend"
subnet_south_name = "olaf-test-edge-vpc-zone-2-sn-vyos-public"

vyos_image_cos_instance_name = "oku-objstrg1"
vyos_image_cos_bucket_name   = "oku-obj1-images"
vyos_management_ip           = "10.21.0.30"
vyos_ssh_key                 = "olaf-at-itzemea-rsa"