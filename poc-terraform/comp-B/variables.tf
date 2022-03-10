###############################################################
#                       COMPARTMENT                           #
###############################################################

variable "compartment_name" {
  type        = string
  description = "Compartment Name to be given"
  nullable    = false
}

variable "compartment_id" {
  type        = string
  description = "Parent Compartment ID"
}

########################################################
#                       VCNs                           #
########################################################

variable "comp_b_vcns" {
  type        = map(string)
  description = "VCNs in Current Compartments"
}

########################################################
#                       SUBNET                         #
########################################################

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


