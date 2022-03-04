# VCN

resource "oci_core_vcn" "my_vcn" {
  compartment_id = var.compartment_id
  dns_label      = var.vcn_dns_label
  cidr_block     = var.vcn_cidr_block
  display_name   = var.vcn_name
}
