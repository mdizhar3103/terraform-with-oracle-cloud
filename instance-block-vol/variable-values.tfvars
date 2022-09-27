# terraform plan -var-file=variable-values.tfvars

# Compartments
compartment_id = ""

# VCN
vcn_name = "TF-VCN"
vcn_cidr_block = "10.12.0.0/16"
vcn_dns_label = "tfvcn"

# Subnets
public_subnet_display_name = "PUB-SN"
public_subnet_cidr = "10.12.128.0/17"
public_subnet_dns_label = "pubsn"
public_subnet_prohibit_public_ip_on_vnic = false

# Route Tables
public_route_table_destination = "0.0.0.0/0"
public_route_table_route_rules_description = "External traffic Gateway for end users"

# Security Lists
public_subnet_security_list_ingress_source = "0.0.0.0/0"
public_subnet_security_list_egress_destination = "0.0.0.0/0"

# Internet Gateways
internet_gw_display_name = "IGW"

# Instance
instance_shape = "VM.Optimized3.Flex"
source_id = "ocid1.image.oc1.ap-mumbai-1.aaaaaaaaylbt6hihudqo6mzcgegmjnxnr5ssggfcqjb6ukhe52fosrsy7oba"
boot_volume = 50
source_type = "image"
instance_name = "TFINS"
shape_memory = 2
shape_ocpus = 1
instance_public_ip = true 
preserve_instance_boot_volume = true 
ssh_key_file_path = "../../../izhar-key.pub"

# Block Volume
block_volume_size = 50
block_volume_attachment_type = "iscsi"
block_volume_attachment_device = "/dev/oracleoci/oraclevdb"

# Remote Execution values
remote_user = "opc"
remote_protocol = "ssh"
remote_connection_key = "../../../izhar.key"