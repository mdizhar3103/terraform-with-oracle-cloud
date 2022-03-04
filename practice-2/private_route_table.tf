resource "oci_core_route_table" "my_vcn_private_route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.my_vcn.id

  display_name = var.private_route_table_display_name
  route_rules {
    network_entity_id = oci_core_nat_gateway.my_vcn_nat_gw.id
    destination       = var.private_route_table_destination
    description       = var.private_route_table_route_rules_description
  }
}