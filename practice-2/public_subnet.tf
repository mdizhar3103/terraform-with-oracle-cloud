# creating public subnet
resource "oci_core_subnet" "my_vcn_public_subnet" {
  vcn_id                     = oci_core_vcn.my_vcn.id
  cidr_block                 = var.public_subnet_cidr
  compartment_id             = var.compartment_id
  display_name               = var.public_subnet_display_name
  dns_label                  = var.public_subnet_dns_label
  prohibit_public_ip_on_vnic = var.public_subnet_prohibit_public_ip_on_vnic
  route_table_id             = oci_core_route_table.my_vcn_public_route_table.id
  security_list_ids          = [oci_core_security_list.my_vcn_public_security_list.id]
}