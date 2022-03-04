# LOAD BALANCER
resource "oci_load_balancer_load_balancer" "my_load_balancer" {
  compartment_id = var.compartment_id
  display_name   = var.load_balancer_display_name
  shape          = var.load_balancer_shape
  subnet_ids     = [oci_core_subnet.my_vcn_public_subnet.id, ]

  is_private                 = var.load_balancer_is_private
  network_security_group_ids = var.load_balancer_network_security_group_ids

  shape_details {
    maximum_bandwidth_in_mbps = var.load_balancer_shape_details_maximum_bandwidth_in_mbps
    minimum_bandwidth_in_mbps = var.load_balancer_shape_details_minimum_bandwidth_in_mbps
  }
}


# Load Balancer Backends Set
resource "oci_load_balancer_backend_set" "my_backend_set" {
  load_balancer_id = oci_load_balancer_load_balancer.my_load_balancer.id
  name             = var.backend_set_name
  policy           = var.backend_set_policy

  health_checker {
    protocol            = var.backend_set_health_checker_protocol
    port                = var.backend_set_health_checker_port
    url_path            = var.backend_set_health_checker_url_path
    response_body_regex = var.backend_set_health_checker_response_body_regex
    interval_ms         = var.backend_set_health_checker_interval_ms
    retries             = var.backend_set_health_checker_retries
    return_code         = var.backend_set_health_checker_return_code
    timeout_in_millis   = var.backend_set_health_checker_timeout_in_millis
  }
}

# Load Balancer Listener
resource "oci_load_balancer_listener" "my_listener" {
  default_backend_set_name = oci_load_balancer_backend_set.my_backend_set.name
  load_balancer_id         = oci_load_balancer_load_balancer.my_load_balancer.id

  name     = var.listener_name
  port     = var.listener_port
  protocol = var.listener_protocol
}

# Load Balancer Backends
resource "oci_load_balancer_backend" "my_backend_1" {
  backendset_name  = oci_load_balancer_backend_set.my_backend_set.name
  load_balancer_id = oci_load_balancer_load_balancer.my_load_balancer.id

  ip_address = oci_core_instance.my_ora_linux_1.private_ip
  port       = var.backend_port

  backup  = var.backend_backup
  drain   = var.backend_drain
  offline = var.backend_offline
  weight  = var.backend_weight
}

resource "oci_load_balancer_backend" "my_backend_2" {
  backendset_name  = oci_load_balancer_backend_set.my_backend_set.name
  load_balancer_id = oci_load_balancer_load_balancer.my_load_balancer.id

  ip_address = oci_core_instance.my_ora_linux_2.private_ip
  port       = var.backend_port

  backup  = var.backend_backup
  drain   = var.backend_drain
  offline = var.backend_offline
  weight  = var.backend_weight
}

/*
# Load Balancer Routing Policy
resource "oci_load_balancer_load_balancer_routing_policy" "my_load_balancer_routing_policy" {
    condition_language_version = var.load_balancer_routing_policy_condition_language_version
    load_balancer_id = oci_load_balancer_load_balancer.my_load_balancer.id
    name = var.load_balancer_routing_policy_name
    rules {
        actions {
            name = var.load_balancer_routing_policy_rules_actions_name
            backend_set_name = oci_load_balancer_backend_set.my_backend_set.name
        }
        condition = var.load_balancer_routing_policy_rules_condition
        name = var.load_balancer_routing_policy_rules_name
    }
}
*/
