resource "oci_core_internet_gateway" "vcn_01_internet_gw" {
  vcn_id         = oci_core_vcn.vcn_01.id
  compartment_id = var.compartment_id
  display_name   = var.internet_gw_display_name
}