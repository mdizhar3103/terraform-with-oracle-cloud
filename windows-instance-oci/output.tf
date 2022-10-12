output "instance_public_ip" {
  value = oci_core_instance.win_instance_01.public_ip
}

output "username" {
  value = data.oci_core_instance_credentials.win_instance_01_cred.username
}

output "password" {
  value = data.oci_core_instance_credentials.win_instance_01_cred.password
}
