resource "oci_core_security_list" "subnet_01_security_list" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.vcn_01.id
  display_name   = "${var.public_subnet_display_name}-SL-01"

  ingress_security_rules {
    source      = var.public_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow RDP request from public subnet"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  ingress_security_rules {
    source      = var.public_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow WinRM request from public subnet"
    tcp_options {
      min = var.remote_port
      max = var.remote_port
    }
  }

  egress_security_rules {
    destination = var.public_subnet_security_list_egress_destination
    protocol    = "all"
  }
}