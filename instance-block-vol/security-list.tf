resource "oci_core_security_list" "subnet_01_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn_01.id
  display_name   = "${var.public_subnet_display_name}-SL-01"

  ingress_security_rules {
    source      = var.public_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow SSH request from public subnet"
    tcp_options {
      min = 22
      max = 22
    }
  }

  egress_security_rules {
    destination = var.public_subnet_security_list_egress_destination
    protocol    = "all"
  }
}