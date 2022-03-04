#############
# PROVIDERS #
#############

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

#######
# VCN #
#######

variable "vcn_name" {
  type        = string
  description = "VCN Display Name"
  default     = "My-VCN"
}

variable "vcn_cidr_block" {
  type    = string
  default = "10.12.0.0/16"
}

variable "vcn_dns_label" {
  type        = string
  description = "DNS label for VCN"
  default     = "myvcn"
}

#################
# PUBLIC SUBNET #
#################

variable "public_subnet_cidr" {
  type        = string
  description = "VCN Public Subnet CIDR"
  default     = "10.12.128.0/17"
}

variable "public_subnet_display_name" {
  type        = string
  description = "VCN Private Subnet Display Name"
  default     = "My-VCN-Public-Subnet"
}

variable "public_subnet_dns_label" {
  type        = string
  description = "Public Subnet DNS Label"
  default     = "myvcnpubsubnet"
}

variable "public_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "public subnet prohibit public ip on vnic"
  default     = false
}


##################
# PRIVATE SUBNET #
##################

variable "private_subnet_cidr" {
  type        = string
  description = "VCN Private Subnet CIDR"
  default     = "10.12.0.0/17"
}

variable "private_subnet_display_name" {
  type        = string
  description = "VCN Private Subnet Display Name"
  default     = "My-VCN-Private-Subnet"
}

variable "private_subnet_dns_label" {
  type        = string
  description = "Private Subnet DNS Label"
  default     = "myvcnpvtsubnet"
}

variable "private_subnet_prohibit_public_ip_on_vnic" {
  type        = bool
  description = "private subnet prohibit public ip on vnic"
  default     = true
}


################
# ROUTE TABLES #
################

variable "public_route_table_display_name" {
  type        = string
  description = "Public Route Table Display Name"
  default     = "My-VCN-Public-Subnet-Route-Table"
}

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

variable "private_route_table_display_name" {
  type        = string
  description = "Private Route Table Display Name"
  default     = "My-VCN-Private-Subnet-Route-Table"
}

variable "private_route_table_destination" {
  type        = string
  description = "Private Route Tables Destination"
  default     = "0.0.0.0/0"
}

variable "private_route_table_route_rules_description" {
  type        = string
  description = "Private Route Tables Route Rules Description"
  default     = "External traffic Gateway for OS/pacakges updates"
}


#########################
# PRIVATE SECURITY LIST #
#########################

variable "private_subnet_security_list_display_name" {
  type        = string
  description = "Private Security List Display Name"
  default     = "My-VCN-Private-Subnet-SL"
}

variable "private_subnet_security_list_ingress_source" {
  type        = string
  description = "Source CIDR for Private Subnet"
  default     = "10.12.128.0/17"
}

variable "private_subnet_security_list_egress_destination" {
  type        = string
  description = "Destination CIDR for Private Subnet"
  default     = "0.0.0.0/0"
}


#########################
# PUBLIC SECURITY LIST #
#########################

variable "public_subnet_security_list_display_name" {
  type        = string
  description = "Public Security List Display Name"
  default     = "My-VCN-Public-Subnet-SL"
}

variable "public_subnet_security_list_ingress_source" {
  type        = string
  description = "Source CIDR for Public Subnet"
  default     = "0.0.0.0/0"
}

variable "public_subnet_security_list_egress_destination" {
  type        = string
  description = "Destination CIDR for Public Subnet"
  default     = "10.12.0.0/17"
}

variable "public_subnet_security_list_egress_destination_2" {
  type        = string
  description = "Egress Destination 2 CIDR for Public Subnet"
  default     = "0.0.0.0/0"
}


#####################
# INTERNET GATEWAYS #
#####################

variable "internet_gw_display_name" {
  type        = string
  description = "Internet Gateway Display Name"
  default     = "My-VCN-Internet-GW"
}


################
# NAT GATEWAYS #
################

variable "nat_gw_display_name" {
  type        = string
  description = "NAT Gateway Display Name"
  default     = "My-VCN-NAT-GW"
}


###############
# COMPARTMENT #
###############

variable "compartment_id" {
  type        = string
  description = "Compartment ID for creating resources"
  default     = "ocid1.ajskncasajskfcnscdsjklnc-dummy-value-sjfkdnsudjcbk"
  sensitive   = true
}


#############
# INSTANCES #
#############

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
  default     = "My-Instance"
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

variable "instance_public_ip" {
  type        = bool
  description = "Assign Public IP to Instance"
  default     = false
}

variable "preserve_instance_boot_volume" {
  type        = bool
  description = "Preserve (Terminate) Instance Boot Volume"
  default     = false
}


#################
# LOAD BALANCER #
#################

variable "load_balancer_display_name" {
  type        = string
  description = "Display Name for Load Balancer"
  default     = "MyLB"
}

variable "load_balancer_shape" {
  type        = string
  description = "Load Balancer Shape"
  default     = "flexible"
}

variable "load_balancer_subnet_ids" {
  type        = list(string)
  description = "Load Balancer Subnet IDs"
  default     = []
}

variable "load_balancer_is_private" {
  type        = bool
  description = "Load Balancer is private"
  default     = false
}

variable "load_balancer_network_security_group_ids" {
  type        = list(string)
  description = "Load Balancer"
  default     = []
}

variable "load_balancer_shape_details_maximum_bandwidth_in_mbps" {
  description = "Load Balancer Maximum Shape Bandwidth"
  type        = string
  default     = "100"
}

variable "load_balancer_shape_details_minimum_bandwidth_in_mbps" {
  description = "Load Balancer Minimum Shape Bandwidth"
  type        = string
  default     = "10"
}

# Backendset variables
variable "backend_set_name" {
  description = "Load Balancer Backend Set Name"
  type        = string
  default     = "my_lb_backend_sets"
}

variable "backend_set_policy" {
  description = "Load Balancer Backend Policy"
  type        = string
  default     = "ROUND_ROBIN"
}

variable "backend_set_health_checker_protocol" {
  type        = string
  description = "Load Balancer Backend Health Check Protocol"
  default     = "HTTP"
}

variable "backend_set_health_checker_port" {
  type        = string
  description = "Load Balancer Backend Health Check Port"
  default     = "80"
}

variable "backend_set_health_checker_url_path" {
  type        = string
  description = "Health Check URL Path"
  default     = "/"
}

variable "backend_set_health_checker_response_body_regex" {
  type        = string
  description = "Health Check Response Body Regex"
  default     = ".*"
}

variable "backend_set_health_checker_interval_ms" {
  type        = number
  description = "Health Check Interval in Milliseconds"
  default     = 10000
}

variable "backend_set_health_checker_retries" {
  type        = string
  description = "Health Check Number of Retries"
  default     = "3"
}

variable "backend_set_health_checker_return_code" {
  type        = number
  description = "Health Check Status Return Code"
  default     = 200
}

variable "backend_set_health_checker_timeout_in_millis" {
  type        = number
  description = "Health Check Interval in Milliseconds"
  default     = 3000
}

# Listener variables
variable "listener_name" {
  type        = string
  description = "Load Balancer Listener Name"
  default     = "my_load_balancer_listener"
}

variable "listener_port" {
  type        = number
  description = "Load Balancer Listener Port"
  default     = 80
}

variable "listener_protocol" {
  type        = string
  description = "Load Balancer Listener Protocol"
  default     = "HTTP"
}

# Backend variables
variable "backend_port" {
  type        = number
  description = "Backend (Instance) Port Number"
  default     = 80
}

variable "backend_backup" {
  type        = bool
  description = "Backend Backup"
  default     = false
}

variable "backend_drain" {
  type        = bool
  description = "Backend Drain"
  default     = false
}

variable "backend_offline" {
  type        = bool
  description = "Backend Offline"
  default     = false
}

variable "backend_weight" {
  type        = number
  description = "Backend Weight"
  default     = 1
}

# Load Balancer Routing Policy Variable
variable "load_balancer_routing_policy_name" {
  type        = string
  description = "Load Balancer Routing Policy Name"
  default     = "my_lb_routing_policy"
}

variable "load_balancer_routing_policy_rules_actions_name" {
  type        = string
  description = "Load Balancer Routing Policy Rules Action Name"
  default     = "my_lb_routing_policy_action_rule"
}

variable "load_balancer_routing_policy_rules_name" {
  type        = string
  description = "Load Balancer Routing Policy Rules Name"
  default     = "my_lb_routing_policy_rule"
}
