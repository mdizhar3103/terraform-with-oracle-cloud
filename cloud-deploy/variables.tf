variable "tenancy_ocid" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "user_ocid" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "fingerprint" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "private_key_path" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

variable "region" {
  type        = string
  description = "Using the Default Value"
  default     = ""
}

################################################
# VCN Variables
################################################

variable "compartment_id" {
  type        = string
  description = "Compartment ID for creating resources"
  default     = "ocid1.compartment.oc1..aaaaaaaaauuc2gra6uohnflxzn4ldkgbhyfjf5pq6ubcxdmhmkftdc2fo5zq"
  sensitive   = true
}

variable "vcn_name" {
  type        = string
  description = "VCN Display Name"
  default     = "TFVCNtest"

}

variable "vcn_cidr_block" {
  type    = string
  default = "10.12.0.0/16"
}

variable "dns_label" {
  type        = string
  description = "DNS label for VCN"
  default     = "terraformtest"
}

################################################
# VCN Subnet Variables
################################################

variable "vcn_pvt_subnet_cidr" {
  type        = string
  description = "VCN Private Subnet CIDR"
  default     = "10.12.0.0/17"
}

variable "vcn_pvt_sbnt_display_name" {
  type        = string
  description = "VCN Private Subnet Display Name"
  default     = "TF-Pvt-SN-test"
}

variable "vcn_pvt_sbnt_dns_label" {
  type        = string
  description = "Private Subnet DNS Label"
  default     = "tfpvttest"
}

# public subnet

variable "vcn_pub_subnet_cidr" {
  type        = string
  description = "VCN Public Subnet CIDR"
  default     = "10.12.128.0/17"
}

variable "vcn_pub_sbnt_display_name" {
  type        = string
  description = "VCN Private Subnet Display Name"
  default     = "TF-Pub-SN-test"
}

variable "vcn_pub_sbnt_dns_label" {
  type        = string
  description = "Public Subnet DNS Label"
  default     = "fpubtest"
}


# Route Table Variables
variable "pvt_route_table_display_name" {
  type        = string
  description = "Private Route Table Display Name"
  default     = "Pvt-test-TF-RT"
}

variable "pub_route_table_display_name" {
  type        = string
  description = "Private Route Table Display Name"
  default     = "Pub-test-TF-RT"
}

# NAT Gateway Variables
variable "nat_gw_display_name" {
  type        = string
  description = "NAT Gateway Display Name"
  default     = "Test-TF-NATGW"
}


# Internet Gateway Variables
variable "igw_display_name" {
  type        = string
  description = "Internet Gateway Display Name"
  default     = "Test-TF-IGW"
}


# Security List Variables for Private Subnet
variable "pvt_subnet_security_list_display_name" {
  type        = string
  description = "Private Security List Display Name"
  default     = "Test-TF-Pvt-SL"
}

variable "pvt_subnet_security_list_ingress_source" {
  type        = string
  description = "Source CIDR for Private Subnet"
  default     = "10.12.128.0/17"
}

variable "pvt_subnet_security_list_egress_destination" {
  type        = string
  description = "Destination CIDR for Private Subnet"
  default     = "0.0.0.0/0"
}

# Security List Variables for Public Subnet

variable "pub_subnet_security_list_display_name" {
  type        = string
  description = "Public Security List Display Name"
  default     = "Test-TF-Pub-SL"
}

variable "pub_subnet_security_list_ingress_source" {
  type        = string
  description = "Source CIDR for Public Subnet"
  default     = "0.0.0.0/0"
}

variable "pub_subnet_security_list_egress_destination" {
  type        = string
  description = "Destination CIDR for Public Subnet"
  default     = "10.12.0.0/17"
}


# Instance Variables

variable "instance_shape" {
  type        = string
  description = "Instance Shape"
  default     = "VM.Optimized3.Flex"
}

variable "source_id" {
  type        = string
  description = "Instance Source Details"
  default     = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaagosxifkwha6a6pi2fxx4idf3te3icdsf7z6jar2sxls6xycnehna"
  sensitive   = true
}

variable "boot_volume" {
  type        = number
  description = "Boot Volume Size in GBs"
  default     = 50
}

variable "source_type" {
  type        = string
  description = "Instance Source type"
  default     = "image"
}

variable "instance_name" {
  type        = string
  description = "Instance Name to Display"
  default     = "Test-VM-TF"
}

variable "availability_domain" {
  type        = string
  description = "Availability Domain Name"
  default     = ""

}

variable "shape_memory" {
  type        = string
  description = "Instance Memory Size"
  default     = "10"
}

variable "shape_ocpus" {
  type        = string
  description = "Instance OCPUs"
  default     = "1"
}

# Bastion VM variables
variable "bastion_source_id" {
  type        = string
  description = "Bastion Windows Source ID"
  default     = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaalfg7v5zxgf4np25wmho5pxtezg5anfgxqe7vfa2wirasl6bzk34q"
}
# https://docs.oracle.com/en-us/iaas/images/image/04ba824f-4a82-46c6-a0c3-e94cd5395f30/
