output "vcn_state" {
  description = "State of VCN that is created"
  value       = oci_core_vcn.myvcn.state
}

output "show-ads" {
  value = data.oci_identity_availability_domains.ads.availability_domains[0].name
}