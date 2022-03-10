# compartment A Hub VCN
locals {
  index_val = 0
}

resource "oci_core_vcn" "comp-a-hub-vcn" {
  compartment_id = oci_identity_compartment.tf-compartment-a.id
  cidr_block     = var.comp_a_vcns_cidr_blocks[local.index_val]
  display_name   = var.comp_a_vcns_display_name[local.index_val]
}

