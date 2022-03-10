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

variable "comp_a_vcns_display_name" {
  type        = list(string)
  description = "VCNs Name list in Compartment B"
}

variable "comp_a_vcns_cidr_blocks" {
  type        = list(string)
  description = "VCNs CIDR Blocks list in Compartment B"
}

########################################################
#                       SUBNET                         #
########################################################

variable "hub_vcn_subnets" {
  type = map(string)
  description = "Hub VCN Subnets"
}

variable "subnet_prohibit_public_ip_on_vnic" {
  type = bool
  description = "Prohibit Public IP on vnic"
  default = true
}