# compartment B nonprod VCN
resource "oci_core_vcn" "comp-a-vcns" {
  compartment_id = oci_identity_compartment.tf-compartment-a.id
  for_each       = var.comp_a_vcns
  cidr_block     = each.value
  display_name   = each.key
}

