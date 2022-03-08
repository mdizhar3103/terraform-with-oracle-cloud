resource "oci_identity_compartment" "tf-compartment-a" {
  compartment_id = var.compartment_id
  description    = "Compartment A for Terraform resources."
  name           = var.compartment_name
}
