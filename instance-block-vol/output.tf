# Outputs
output "instance_public_ip" {
  value = oci_core_instance.linux_instance_01.public_ip
}