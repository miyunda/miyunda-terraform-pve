terraform {
  required_providers {
    proxmox = {
      source = "telmate/proxmox"
    }
  }
}

resource "proxmox_vm_qemu" "pve-tf" {
  agent       = 1
  count       = 0
  vmid        = 201 + count.index
  name        = "k8s-prod-0${1 + count.index}"
  target_node = "proxmox"
  clone       = "bullseye-vm-tmpl"
  full_clone  = "true"
  os_type     = "cloud-init"
  cores       = "2"
  sockets     = "1"
  cpu         = "host"
  memory      = 4096
  scsihw      = "virtio-scsi-pci"
  bootdisk    = "scsi0"
  disk {
    size    = "8G"
    type    = "scsi"
    storage = "local-lvm"
    iothread = 1
  }
  network {
    model  = "virtio"
    bridge = "vmbr0"
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }
  # Create Ansible user, introduce its SSH key pub.
  ciuser  = "ansibleops"
  sshkeys = <<EOF
  ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIL5z4HQz55B+OOhiWGmb82sLDBHeqJFUbesQ5n045O0J ansibleops@miyunda.com
  EOF
}