###################################################
# Copyright (C) IBM Corp. 2022 All Rights Reserved.
# Licensed under the Apache License v2.0
###################################################

terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version = "1.74.0"
    }
    vyos = {
      source = "Foltik/vyos"
      version = "0.3.3"
    }
  }
}