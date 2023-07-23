

resource "proxmox_vm_qemu" "ubuntu_2204_server" {

    name = "testring"
    desc = <<-EOT
    test

__ user10 __
    EOT
    vmid = "102"
    target_node = "proxmox"

    clone = "ubuntu-2204-server"
    clone_wait = 20
    cores = 1
    sockets = 1
    cpu = "host"
    memory = 512

    network {
        bridge = "vmbr0"
        model = "virtio"
    }

    disk {
        storage = "local-lvm"
        type = "virtio"
        size = "10740M"
    }

    os_type = "cloud-init"
    ciuser = "user10"
    cipassword = "user10"

}