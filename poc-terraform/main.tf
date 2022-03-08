module "comp_a_module" {
  source = "./comp-A"

  # compartment name
  compartment_name = var.compartment_names[0]

  # parent compartment_id
  compartment_id = var.compartment_id

  # vcns
  comp_a_vcns = var.comp_a_vcns
}

module "comp_b_module" {
  source = "./comp-B"

  # compartment name
  compartment_name = var.compartment_names[1]

  # parent compartment_id
  compartment_id = var.compartment_id

  # vcns
  comp_b_vcns = var.comp_b_vcns

  # subents
  prod_vcn_subnets                  = var.prod_vcn_subnets
  nonprod_vcn_subnets               = var.nonprod_vcn_subnets
  subnet_prohibit_public_ip_on_vnic = var.subnet_prohibit_public_ip_on_vnic
}

