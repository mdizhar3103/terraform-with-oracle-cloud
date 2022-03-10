comp_b_vcns_display_name = ["nonprod-vcn", "prod-vcn"]
comp_b_vcns_cidr_blocks  = ["172.16.0.0/16", "192.168.0.0/16"]

prod_vcn_subnets = {
  "prod-vcn-pvt1-sn" = "192.168.1.0/24",
  "prod-vcn-pvt2-sn" = "192.168.2.0/24",
  "prod-vcn-pvt3-sn" = "192.168.3.0/24"
}

nonprod_vcn_subnets = {
  "nonprod-vcn-pvt-sn" = "172.16.1.0/24",
}

