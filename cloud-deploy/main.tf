terraform {
  required_providers {
    oci = {
      source = "hashicorp/oci"
    }
  }
}

provider "oci" {
  tenancy_ocid     = var.tenancy_ocid
  user_ocid        = var.user_ocid
  fingerprint      = var.fingerprint
  private_key_path = var.private_key_path
  region           = var.region
}

# creating VCN
resource "oci_core_vcn" "myvcn" {
  dns_label      = var.dns_label
  cidr_block     = var.vcn_cidr_block
  compartment_id = var.compartment_id
  display_name   = var.vcn_name
}

# creating private subnet
resource "oci_core_subnet" "myvcn_pvt_sbnt" {
  vcn_id                     = oci_core_vcn.myvcn.id
  cidr_block                 = var.vcn_pvt_subnet_cidr
  compartment_id             = var.compartment_id
  display_name               = var.vcn_pvt_sbnt_display_name
  dns_label                  = var.vcn_pvt_sbnt_dns_label
  prohibit_public_ip_on_vnic = true
  route_table_id             = oci_core_route_table.pvt_route_table.id
  security_list_ids          = [oci_core_security_list.myvcn_pvt_sl.id]
}

# creating public subnet
resource "oci_core_subnet" "myvcn_pub_sbnt" {
  vcn_id                     = oci_core_vcn.myvcn.id
  cidr_block                 = var.vcn_pub_subnet_cidr
  compartment_id             = var.compartment_id
  display_name               = var.vcn_pub_sbnt_display_name
  dns_label                  = var.vcn_pub_sbnt_dns_label
  prohibit_public_ip_on_vnic = false
  route_table_id             = oci_core_route_table.pub_route_table.id
  security_list_ids          = [oci_core_security_list.myvcn_pub_sl.id]
}

# Create route tables
resource "oci_core_route_table" "pvt_route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.myvcn.id

  display_name = var.pvt_route_table_display_name
  route_rules {
    network_entity_id = oci_core_nat_gateway.myvcn_nat_gw.id
    destination       = "0.0.0.0/0"
    description       = "External traffic Gateway for OS/pacakges updates"
  }
}

resource "oci_core_route_table" "pub_route_table" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.myvcn.id

  display_name = var.pub_route_table_display_name
  route_rules {
    network_entity_id = oci_core_internet_gateway.myvcn_igw.id
    destination       = "0.0.0.0/0"
    description       = "External traffic Gateway for end users"
  }
}


# creating NATGW
resource "oci_core_nat_gateway" "myvcn_nat_gw" {
  vcn_id         = oci_core_vcn.myvcn.id
  compartment_id = var.compartment_id
  display_name   = var.nat_gw_display_name
}


# creating IGW
resource "oci_core_internet_gateway" "myvcn_igw" {
  vcn_id         = oci_core_vcn.myvcn.id
  compartment_id = var.compartment_id
  display_name   = var.igw_display_name
}


# Creating Private Security List
resource "oci_core_security_list" "myvcn_pvt_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.myvcn.id
  display_name   = var.pvt_subnet_security_list_display_name

  ingress_security_rules {
    source      = var.pvt_subnet_security_list_ingress_source
    protocol    = 6 # tcp
    description = "Allow SSH from private subnets"
    tcp_options {
      min = 22
      max = 22
    }
  }

  ingress_security_rules {
    source      = var.pvt_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow HTTP request from public subnet"
    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    source      = var.pvt_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow RDP request from public subnet"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  egress_security_rules {
    destination = var.pvt_subnet_security_list_egress_destination
    protocol    = "all"
  }
}


# Creating Private Security List
resource "oci_core_security_list" "myvcn_pub_sl" {
  compartment_id = var.compartment_id
  vcn_id         = oci_core_vcn.myvcn.id
  display_name   = var.pub_subnet_security_list_display_name

  ingress_security_rules {
    source      = var.pub_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow HTTP request from public subnet"
    tcp_options {
      min = 80
      max = 80
    }
  }

  ingress_security_rules {
    source      = var.pub_subnet_security_list_ingress_source
    protocol    = 6
    description = "Allow RDP request from public subnet"
    tcp_options {
      min = 3389
      max = 3389
    }
  }

  egress_security_rules {
    destination = var.pub_subnet_security_list_egress_destination
    protocol    = 6
    tcp_options {
      min = 80
      max = 80
    }
  }
}


# Create instances
data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "rhel_instance_1" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape


  shape_config {
    memory_in_gbs = var.shape_memory
    ocpus         = var.shape_ocpus
  }

  display_name = "${var.instance_name}-Linux-1"
  source_details {
    source_id               = var.source_id
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_volume
  }

  create_vnic_details {
    assign_public_ip = false
    subnet_id        = oci_core_subnet.myvcn_pvt_sbnt.id
  }

  metadata = {
    ssh_authorized_keys = file("/home/mohdizhar/.ssh/id_rsa.pub")
  }

  preserve_boot_volume = false
}

resource "oci_core_instance" "rhel_instance_2" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape

  shape_config {
    memory_in_gbs = var.shape_memory
    ocpus         = var.shape_ocpus
  }

  display_name = "${var.instance_name}-Linux-2"
  source_details {
    source_id               = var.source_id
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_volume
  }

  create_vnic_details {
    assign_public_ip = false
    subnet_id        = oci_core_subnet.myvcn_pvt_sbnt.id
  }

  metadata = {
    ssh_authorized_keys = file("/path_to_ssh_public_file")
  }

  preserve_boot_volume = false
}