data "oci_core_vcns" "test_vcns" {
  #Required
  compartment_id = oci_identity_compartment.tf-compartment-b.id
}

output "list_vcns_ids" {
  #value = data.oci_core_vcns.test_vcns.virtual_networks[2]
  value = { for obj_vcn in data.oci_core_vcns.test_vcns.virtual_networks : obj_vcn.display_name => obj_vcn.id }
}
