resource "oci_core_subnet" "subnet_01" {
  cidr_block     = var.public_subnet_cidr
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn_01.id

  display_name = var.public_subnet_display_name
  dns_label    = var.public_subnet_dns_label

  prohibit_public_ip_on_vnic = var.public_subnet_prohibit_public_ip_on_vnic
  route_table_id             = oci_core_route_table.subnet_01_public_route_table.id
  security_list_ids          = [oci_core_security_list.subnet_01_security_list.id]
}