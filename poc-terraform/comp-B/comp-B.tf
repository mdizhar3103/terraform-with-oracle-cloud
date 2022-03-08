resource "oci_identity_compartment" "tf-compartment-b" {
  compartment_id = var.compartment_id
  description    = "Compartment B for Terraform resources."
  name           = var.compartment_name
}
