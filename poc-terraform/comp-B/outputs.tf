data "oci_core_vcns" "list_vcns" {
  #Required
  compartment_id = oci_identity_compartment.tf-compartment-b.id
}

output "comp_b_vcns" {
  # value = data.oci_core_vcns.list_vcns.virtual_networks
  value = { for obj_vcn in data.oci_core_vcns.list_vcns.virtual_networks : obj_vcn.display_name => obj_vcn.id }
}
