resource "yandex_compute_disk" "disks" {
  count = var.compute_disk_count
  name       = "disk-${count.index}"
  type       = "network-hdd"
  zone       = var.default_zone
  size       = var.compute_disk_size
}

resource "yandex_compute_instance" "storage_vm" {
  name        = "storage"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vms_res.web.cores
    memory        = var.vms_res.web.memory
    core_fraction = var.vms_res.web.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.hard_disk_type
      size = var.boot_disk_size
    }
  }

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.disks.*.id
    content {
      disk_id = secondary_disk.value
    }
  }

  metadata = {
    ssh-keys = local.ssh-key
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
    security_group_ids = [ yandex_vpc_security_group.example.id ]
  }
  allow_stopping_for_update = true
}
