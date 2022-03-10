locals {
  compartment_id = oci_identity_compartment.tf-compartment-a.id
}

resource "oci_core_subnet" "hub_vcn_subnets" {
  vcn_id         = oci_core_vcn.comp-a-hub-vcn.id
  compartment_id = local.compartment_id

  for_each     = var.hub_vcn_subnets
  cidr_block   = each.value
  display_name = each.key

  prohibit_public_ip_on_vnic = (each.key == "hub-vcn-pub-sn" ? false : var.subnet_prohibit_public_ip_on_vnic)
  #   route_table_id             = oci_core_route_table.my_vcn_private_route_table.id
}
