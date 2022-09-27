###########################################################
#                       PROVIDERS 
###########################################################

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

###########################################################
#                       Compartments
###########################################################

variable "compartment_id" {
  type        = string
  description = "Compartment ID for creating resources"
  default     = "ocid1.compartment"
  sensitive   = true
}


###########################################################
#                       VCN
###########################################################

variable "vcn_name" {
  type        = string
  description = "VCN Display Name"
  default     = "TF-VCN"
}

variable "vcn_cidr_block" {
  type    = string
  default = "10.12.0.0/16"
}

# generally use vcn name without any special characters
variable "vcn_dns_label" {
  type        = string
  description = "DNS label for VCN"
  default     = "tfvcn"
}


###########################################################
#                       Subnets
###########################################################


variable "public_subnet_cidr" {
  type        = string
  description = "VCN Public Subnet CIDR"
  default     = "10.12.128.0/17"
}

variable "public_subnet_display_name" {
  type        = string
  description = "VCN Public Subnet Display Name"
  default     = "PUB-SN"
}

variable "public_subnet_dns_label" {
  type        = string
  description = "Public Subnet DNS Label"
  default     = "pubsn"
}

variable "public_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "public subnet prohibit public ip on vnic"
  default     = false
}


###########################################################
#                       Route Tables
###########################################################

variable "public_route_table_destination" {
  type        = string
  description = "Public Route Tables Destination"
  default     = "0.0.0.0/0"
}

variable "public_route_table_route_rules_description" {
  type        = string
  description = "Public Route Tables Route Rules Description"
  default     = "External traffic Gateway for end users"
}

###########################################################
#                       Security Lists
###########################################################

variable "public_subnet_security_list_ingress_source" {
  type        = string
  description = "Source CIDR for Public Subnet"
  default     = "0.0.0.0/0"
}

variable "public_subnet_security_list_egress_destination" {
  type        = string
  description = "Destination CIDR for Public Subnet"
  default     = "0.0.0.0/0"
}

###########################################################
#                       Internet Gateways
###########################################################

variable "internet_gw_display_name" {
  type        = string
  description = "Internet Gateway Display Name"
  default     = "IGW"
}

###########################################################
#                       Instance
###########################################################

variable "instance_shape" {
  type        = string
  description = "Instance Shape"
  default     = "VM.Optimized3.Flex"
}

variable "source_id" {
  type        = string
  description = "Instance Source Details"
  default     = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaaylbt6hihudqo6mzcgegmjnxnr5ssggfcqjb6ukhe52fosrsy7oba"
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
  default     = "TFINS"
}

variable "availability_domain" {
  type        = string
  description = "Availability Domain Name"
  default     = ""

}

variable "shape_memory" {
  type        = number
  description = "Instance Memory Size in GB"
  default     = 2
}

variable "shape_ocpus" {
  type        = number
  description = "Instance OCPUs"
  default     = 1
}

variable "instance_public_ip" {
  type        = bool
  description = "Assign Public IP to Instance"
  default     = true
}

variable "preserve_instance_boot_volume" {
  type        = bool
  description = "Preserve (Terminate) Instance Boot Volume"
  default     = true
}

variable "ssh_key_file_path" {
    type        = string
    description = "SSH Key for accessing Linux Instance"
    default     = "../../../izhar-key.pub"
}


###########################################################
#                       Block Volume
###########################################################

variable "block_volume_size" {
  type        = number
  description = "Default Block Volume Size in GB"
  default     = 50
}

variable "block_volume_attachment_type" {
  type        = string
  description = "Default Block Volume Attachment Type"
  default     = "iscsi"
}

variable "block_volume_attachment_device" {
  type        = string
  description = "Default Block Volume Device Attachment"
  default     = "/dev/oracleoci/oraclevdb"
}

###########################################################
#                       Remote Execution
###########################################################

variable "remote_user" {
  type        = string
  description = "Default Remote User to Connect to Server"
  default     = "opc"
}

variable "remote_protocol" {
  type        = string
  description = "Default Remote Protocol to Connect to Server"
  default     = "ssh"
}

variable "remote_connection_key" {
  type        = string
  description = "Private Key Path for Connecting to Server"
  default     = "../../../izhar.key"
}

