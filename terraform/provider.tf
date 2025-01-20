###################################################
# Copyright (C) IBM Corp. 2022 All Rights Reserved.
# Licensed under the Apache License v2.0
###################################################

provider "vyos" {
  # Configuration options
  url = var.vyos_api_url
  key = var.vyos_api_key
}

provider "ibm" {
  # Configuration options
  region           = var.ibmcloud_region
  ibmcloud_api_key = var.ibmcloud_api_key
}
