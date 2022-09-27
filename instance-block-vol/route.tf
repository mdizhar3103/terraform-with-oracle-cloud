resource "oci_core_route_table" "subnet_01_public_route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn_01.id

  display_name = "${var.vcn_name}-${var.public_subnet_display_name}-01-RT"
  route_rules {
    network_entity_id = oci_core_internet_gateway.vcn_01_internet_gw.id
    destination       = var.public_route_table_destination
    description       = var.public_route_table_route_rules_description
  }
}