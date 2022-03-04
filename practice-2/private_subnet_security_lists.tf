resource "oci_core_security_list" "my_vcn_private_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.my_vcn.id
  display_name   = var.private_subnet_security_list_display_name

  ingress_security_rules {
    source      = var.private_subnet_security_list_ingress_source
    protocol    = 6 # tcp
    description = "Allow SSH from private subnets"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    source      = var.private_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow HTTP request from public subnet"
    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    source      = var.private_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow RDP request from public subnet"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  egress_security_rules {
    destination = var.private_subnet_security_list_egress_destination
    protocol    = "all"
  }
}
