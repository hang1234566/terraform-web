terraform {
  required_providers {
    hyperv = {
      source  = "windsorcli/hyperv"
      version = "0.4.0"
    }
  }
}

provider "hyperv" {
  backend = "local"
}

locals {
  vm_memory_bytes = var.ram_gb * 1024 * 1024 * 1024
  vhd_size_bytes  = var.disk_gb * 1024 * 1024 * 1024
  vm_switch       = "Default Switch"
  vm_region       = var.region
}

resource "hyperv_vhd" "web_disk" {
  path       = "C:/ProgramData/Microsoft/Windows/Virtual Hard Disks/terraform-web.vhdx"
  vhd_type   = "dynamic"
  size_bytes = local.vhd_size_bytes
}

resource "hyperv_vm" "web_server" {
  name       = var.server_name
  generation = 2

  cpu = {
    count = var.cpu
  }

  memory = {
    startup_bytes = local.vm_memory_bytes
  }

  secure_boot = false

  network_adapter = [
    {
      name        = "Network Adapter"
      switch_name = local.vm_switch
    }
  ]

  hard_disk_drive = [
    {
      path                = "C:/ProgramData/Microsoft/Windows/Virtual Hard Disks/terraform-web.vhdx"
      controller_type     = "SCSI"
      controller_number   = 0
      controller_location = 0
    }
  ]

  dvd_drive = [
    {
      iso_path             = "C:/Users/ACER/Downloads/ubuntu-24.04.5-live-server-amd64.iso"
      controller_type      = "SCSI"
      controller_number    = 0
      controller_location  = 1
    }
  ]

  boot_order = [
    {
      type                 = "dvd_drive"
      controller_type      = "SCSI"
      controller_number    = 0
      controller_location  = 1
    },
    {
      type                 = "hard_disk_drive"
      controller_type      = "SCSI"
      controller_number    = 0
      controller_location  = 0
    }
  ]

  state = {
    desired = "Off"
  }
}