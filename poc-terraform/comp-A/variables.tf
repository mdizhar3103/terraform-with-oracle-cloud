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

variable "comp_a_vcns" {
  type        = map(string)
  description = "VCNs in Current Compartments"
}

