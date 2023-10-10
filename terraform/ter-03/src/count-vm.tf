
resource "yandex_compute_instance" "web_vms" {
  name        = "web-${count.index+1}"
  platform_id = var.vm_platform_id

  count = var.web_wms_count

  resources {
    cores         = var.vms_res.storage.cores
    memory        = var.vms_res.storage.memory
    core_fraction = var.vms_res.storage.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.hard_disk_type
      size = var.boot_disk_size
    }
  }

  metadata = {
#    ssh-keys = "ubuntu:${var.public_key}"
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