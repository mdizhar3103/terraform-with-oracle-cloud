resource "oci_core_vcn" "vcn_01" {
    #Required
    compartment_id = var.compartment_id

    cidr_block = var.vcn_cidr_block
    display_name = var.vcn_name
    dns_label = var.vcn_dns_label   
}
