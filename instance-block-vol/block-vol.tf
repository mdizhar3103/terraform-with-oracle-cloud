resource "oci_core_volume" "volume_01" {
    #Required
    compartment_id = var.compartment_id
    availability_domain = oci_core_instance.linux_instance_01.availability_domain
    display_name = "BLV-${oci_core_instance.linux_instance_01.display_name}"
    size_in_gbs = var.block_volume_size
}

# Attaching the create block volume to instance
resource "oci_core_volume_attachment" "volume_01_attachment" {
    #Required
    attachment_type = var.block_volume_attachment_type
    instance_id = oci_core_instance.linux_instance_01.id
    volume_id = oci_core_volume.volume_01.id

    #Optional
    device = var.block_volume_attachment_device

    # Running ISCSI Commands on Instance
    connection {
        type        = var.remote_protocol
        host        = oci_core_instance.linux_instance_01.public_ip
        user        = var.remote_user
        private_key = file(var.remote_connection_key)
    }
  
    provisioner "remote-exec" {
        inline = [
            "sudo iscsiadm -m node -o new -T ${self.iqn} -p ${self.ipv4}:${self.port}",
            "sudo iscsiadm -m node -o update -T ${self.iqn} -n node.startup -v automatic",
            "sudo iscsiadm -m node -T ${self.iqn} -p ${self.ipv4}:${self.port} -l",
            ]
        }
}