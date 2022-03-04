resource "oci_core_nat_gateway" "my_vcn_nat_gw" {
  vcn_id         = oci_core_vcn.my_vcn.id
  compartment_id = var.compartment_id
  display_name   = var.nat_gw_display_name
}
