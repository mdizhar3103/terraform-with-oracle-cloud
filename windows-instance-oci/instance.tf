data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_id
}

data "template_file" "cloud-config" {
  template = <<POWERSHELL
	#ps1_sysnative
	# enable the iSCSI service
	Set-Service -Name msiscsi -StartupType Automatic
	Start-Service msiscsi

  # disable password expiry to allow winrm remote-exec using opc account
	# cmd /C 'wmic UserAccount where Name="opc" set PasswordExpires=False'
  # cmd /C 'net user "opc" /logonpasswordchg:no'

	POWERSHELL
}

resource "oci_core_instance" "win_instance_01" {
  availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
  compartment_id      = var.compartment_id
  shape               = var.instance_shape

  shape_config {
    memory_in_gbs = var.shape_memory
    ocpus         = var.shape_ocpus
  }

  display_name = var.instance_name
  source_details {
    source_id               = var.source_id
    source_type             = var.source_type
    boot_volume_size_in_gbs = var.boot_volume
  }

  create_vnic_details {
    assign_public_ip = var.instance_public_ip
    subnet_id        = oci_core_subnet.subnet_01.id
  }

  preserve_boot_volume = var.preserve_instance_boot_volume
  # If using template
  # metadata = {
  #   user_data = "${base64encode(data.template_file.cloud-config.rendered)}"
  # }

  metadata = {
    "user_data" = "${base64encode(file(var.user_metedata))}"
  }
}

# get the opc user credentails
data "oci_core_instance_credentials" "win_instance_01_cred" {
  instance_id = oci_core_instance.win_instance_01.id
}
