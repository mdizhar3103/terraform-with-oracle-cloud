# compartment B VCNs
locals {
  index_val_0 = 0
  index_val_1 = 1
}

resource "oci_core_vcn" "comp-b-non-prod-vcn" {
  compartment_id = oci_identity_compartment.tf-compartment-b.id
  cidr_block     = var.comp_b_vcns_cidr_blocks[local.index_val_0]
  display_name   = var.comp_b_vcns_display_name[local.index_val_0]
}

resource "oci_core_vcn" "comp-b-prod-vcn" {
  compartment_id = oci_identity_compartment.tf-compartment-b.id
  cidr_block     = var.comp_b_vcns_cidr_blocks[local.index_val_1]
  display_name   = var.comp_b_vcns_display_name[local.index_val_1]
}
