data "ibm_resource_group" "vyos_rg" {
    name = var.vyos_resource_group_name
}

data "ibm_is_instance_profile" "vyos" {
  name = var.instance_profile_name
}

data "ibm_is_ssh_key" "vyos"{
    name = var.vyos_ssh_key
}

data "ibm_is_vpc" "vyos" {
  name = var.deployment_vpc
}

data "ibm_is_subnet" "vyos_mgmt" {
  name = var.subnet_mgmt_name
  vpc = data.ibm_is_vpc.vyos.id
}

data "ibm_is_subnet" "vyos_north" {
  name = var.subnet_north_name
  vpc = data.ibm_is_vpc.vyos.id
}

data "ibm_is_subnet" "vyos_south" {
  name = var.subnet_south_name
  vpc = data.ibm_is_vpc.vyos.id
}

data "ibm_resource_instance" "vyos_image_cos" {
  name              = var.vyos_image_cos_instance_name
  resource_group_id = data.ibm_resource_group.vyos_rg.id
  service           = "cloud-object-storage"
}

data "ibm_cos_bucket" "vyos_image" {
  resource_instance_id = data.ibm_resource_instance.vyos_image_cos.id
  bucket_name          = var.vyos_image_cos_bucket_name
  bucket_type          = "region_location"
  bucket_region        = var.ibmcloud_region
}

resource "ibm_cos_bucket_object" "vyos_image_file" {
    bucket_crn      = data.ibm_cos_bucket.vyos_image.crn
    bucket_location = data.ibm_cos_bucket.vyos_image.region_location
    content_file    = "../../../vyos/images/vyos-1.5-rolling-0.1.qcow2"
    key             = "vyos-1.5-terraform.qcow2"
    etag            = filemd5("../../../vyos/images/vyos-1.5-rolling-0.1.qcow2")
    #etag            = filemd5("${path.module}/test.png")
}

resource "ibm_is_image" "vyos" {
      name               = "vyos-terraform"
      href               = resource.ibm_cos_bucket_object.vyos_image_file.object_sql_url
      operating_system   = "debian-12-amd64"
      resource_group     = data.ibm_resource_group.vyos_rg.id
      #encrypted_data_key = "eJxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx0="
      #encryption_key     = "crn:v1:bluemix:public:kms:us-south:a/6xxxxxxxxxxxxxxx:xxxxxxx-xxxx-xxxx-xxxxxxx:key:dxxxxxx-fxxx-4xxx-9xxx-7xxxxxxxx"
}

