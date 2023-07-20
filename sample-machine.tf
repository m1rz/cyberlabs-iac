resource "proxmox_vm_qemu" "ubuntu_2204_1" {

    name = "ubuntu-2204-1"
    desc = "test server"
    vmid = "201"
    target_node = "proxmox"

    clone = "ubuntu-2204-server"
    clone_wait = 20
    cores = 2
    sockets = 1
    cpu = "host"
    memory = 2048

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
    ciuser = "cinit"
    cipassword = "cinit"

}