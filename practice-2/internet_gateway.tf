# creating IGW
resource "oci_core_internet_gateway" "my_vcn_internet_gw" {
  vcn_id         = oci_core_vcn.my_vcn.id
  compartment_id = var.compartment_id
  display_name   = var.internet_gw_display_name
}
