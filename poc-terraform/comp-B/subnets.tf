locals {
  compartment_id = oci_identity_compartment.tf-compartment-b.id

  vcns_map = { for obj_vcn in data.oci_core_vcns.list_vcns.virtual_networks : obj_vcn.display_name => obj_vcn.id }
}

data "oci_core_vcns" "list_vcns" {
  compartment_id = local.compartment_id
}

resource "oci_core_subnet" "prod_vcn_subnets" {
#   vcn_id                     = oci_core_vcn.comp-b-vcns.id
  compartment_id             = local.compartment_id
  
  for_each = var.prod_vcn_subnets
  cidr_block                 = each.value
  display_name               = each.key
  vcn_id = lookup(local.vcns_map, "prod-vcn")
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
#   route_table_id             = oci_core_route_table.my_vcn_private_route_table.id
}

resource "oci_core_subnet" "nonprod_vcn_subnets" {
#   vcn_id                     = oci_core_vcn.comp-b-vcns.id
  compartment_id             = local.compartment_id
  
  for_each = var.nonprod_vcn_subnets
  cidr_block                 = each.value
  display_name               = each.key
  vcn_id = lookup(local.vcns_map, "nonprod-vcn")
  prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
#   route_table_id             = oci_core_route_table.my_vcn_private_route_table.id
}
