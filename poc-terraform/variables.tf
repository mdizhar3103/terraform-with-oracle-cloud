#############################################################
#                       PROVIDERS                           #
#############################################################

variable "tenancy_ocid" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "user_ocid" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "fingerprint" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "private_key_path" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "region" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

################################################################
#                       COMPARTMENTS                           #
################################################################

variable "compartment_id" {
  type        = string
  description = "Parent Compartment ID"
  default     = "ocid1.compartment.oc1..aaaaaaaaauuc2gra6uohnflxzn4ldkgbhyfjf5pq6ubcxdmhmkftdc2fo5zq"
  sensitive   = true
}

variable "compartment_names" {
  type        = list(string)
  description = "Compartment Name"
  default     = ["comp-A", "comp-B"]
}

########################################################
#                       VCNs                           #
########################################################

variable "comp_b_vcns" {
  type        = map(string)
  description = "VCNs in Current Compartments"
}

variable "comp_a_vcns" {
  type        = map(string)
  description = "VCNs in Current Compartments"
}

###########################################################
#                       SUBNETS                           #
###########################################################

variable "prod_vcn_subnets" {
  type        = map(string)
  description = "Prod VCN Subnets"
}

variable "nonprod_vcn_subnets" {
  type        = map(string)
  description = "Non-Prod VCN Subnets"
}

variable "subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "Prohibit Public IP on vnic"
  default     = true
}

