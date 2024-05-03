
resource "yandex_compute_instance" "vm_private" {
  name        = "vm-private"
  hostname    = "vm-private"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vms_res.private.cores
    memory        = var.vms_res.private.memory
    core_fraction = var.vms_res.private.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.hard_disk_type
      size = var.boot_disk_size
    }
  }

  metadata = {
    ssh-keys = local.ssh-key
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.private.id
  }
  allow_stopping_for_update = true
}