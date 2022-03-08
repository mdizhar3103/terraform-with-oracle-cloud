# compartment B nonprod VCN
resource "oci_core_vcn" "comp-b-vcns" {
  compartment_id = oci_identity_compartment.tf-compartment-b.id
  for_each       = var.comp_b_vcns
  cidr_block     = each.value
  display_name   = each.key
}

