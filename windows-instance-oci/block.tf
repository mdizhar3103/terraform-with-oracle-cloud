resource "oci_core_volume" "volume_01" {
  #Required
  compartment_id      = var.compartment_id
  availability_domain = oci_core_instance.win_instance_01.availability_domain
  display_name        = "BLV-${oci_core_instance.win_instance_01.display_name}"
  size_in_gbs         = var.block_volume_size
}

# Attaching the create block volume to instance
resource "oci_core_volume_attachment" "volume_01_attachment" {
  #Required
  attachment_type = var.block_volume_attachment_type
  instance_id     = oci_core_instance.win_instance_01.id
  volume_id       = oci_core_volume.volume_01.id

  # Running ISCSI Commands on Instance
  connection {
    type     = var.remote_protocol
    port     = var.remote_port
    insecure = var.remote_insecure
    https    = var.remote_https
    host     = oci_core_instance.win_instance_01.public_ip
    user     = var.remote_user
    password = var.remote_user_passwd

    # trying to use default opc user and credentials 
    # user     = data.oci_core_instance_credentials.win_instance_01_cred.username
    # password = data.oci_core_instance_credentials.win_instance_01_cred.password
  }

  provisioner "remote-exec" {
    inline = [
      # Windows 2019
      "iscsicli.exe QAddTargetPortal ${self.ipv4}",
      "iscsicli.exe QLoginTarget ${self.iqn}",
      "iscsicli.exe PersistentLoginTarget ${self.iqn} * ${self.ipv4} ${self.port} * * * * * * * * * * * * * *",
    ]
  }
}