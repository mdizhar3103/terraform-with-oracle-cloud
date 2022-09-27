data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

resource "oci_core_instance" "linux_instance_01" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape

  shape_config {
    memory_in_gbs = var.shape_memory
    ocpus         = var.shape_ocpus
  }

  display_name = "${var.instance_name}-LNX-01"
  source_details {
    source_id               = var.source_id
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_volume
  }

  create_vnic_details {
    assign_public_ip = var.instance_public_ip
    subnet_id        = oci_core_subnet.subnet_01.id
  }

  metadata = {
    ssh_authorized_keys = file(var.ssh_key_file_path)
  }

  preserve_boot_volume = var.preserve_instance_boot_volume
}