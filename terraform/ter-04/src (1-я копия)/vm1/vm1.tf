terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

data "yandex_compute_image" "ubuntu" {
  family = var.image_family
}

resource "yandex_compute_instance" "vm1" {
  name        = var.name
  hostname    = var.name
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vm_res.cores
    memory        = var.vm_res.memory
    core_fraction = var.vm_res.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.disk_param.type
      size = var.disk_param.size
    }
  }

  metadata = {
    ssh-keys = var.ssh-keys
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }
  allow_stopping_for_update = true
}
