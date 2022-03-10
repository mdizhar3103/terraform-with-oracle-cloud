module "comp_a_module" {
  source = "./comp-A"

  # compartment name
  compartment_name = var.compartment_names[0]

  # parent compartment_id
  compartment_id = var.compartment_id

  # vcns
  comp_a_vcns_display_name = var.comp_a_vcns_display_name
  comp_a_vcns_cidr_blocks  = var.comp_a_vcns_cidr_blocks

  # subents
  hub_vcn_subnets                   = var.hub_vcn_subnets
  subnet_prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
}

module "comp_b_module" {
  source = "./comp-B"

  # compartment name
  compartment_name = var.compartment_names[1]

  # parent compartment_id
  compartment_id = var.compartment_id

  # vcns
  comp_b_vcns_display_name = var.comp_b_vcns_display_name
  comp_b_vcns_cidr_blocks  = var.comp_b_vcns_cidr_blocks

  # subents
  prod_vcn_subnets                  = var.prod_vcn_subnets
  nonprod_vcn_subnets               = var.nonprod_vcn_subnets
  subnet_prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
}

