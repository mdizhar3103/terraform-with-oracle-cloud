locals {
  compartment_id = oci_identity_compartment.tf-compartment-b.id
}

resource "oci_core_subnet" "prod_vcn_subnets" {
  vcn_id                     = oci_core_vcn.comp-b-prod-vcn.id
  compartment_id             = local.compartment_id
  
  for_each = var.prod_vcn_subnets
  cidr_block                 = each.value
  display_name               = each.key

  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
#   route_table_id             = oci_core_route_table.my_vcn_private_route_table.id
}

resource "oci_core_subnet" "nonprod_vcn_subnets" {
  vcn_id                     = oci_core_vcn.comp-b-non-prod-vcn.id
  compartment_id             = local.compartment_id
  
  for_each = var.nonprod_vcn_subnets
  cidr_block                 = each.value
  display_name               = each.key
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
#   route_table_id             = oci_core_route_table.my_vcn_private_route_table.id
}

