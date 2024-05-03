
resource "yandex_compute_instance" "vm_public" {
  name        = "vm-public"
  hostname    = "vm-public"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vms_res.public.cores
    memory        = var.vms_res.public.memory
    core_fraction = var.vms_res.public.core_fraction
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
    subnet_id = yandex_vpc_subnet.public.id
    nat       = true

  }
  allow_stopping_for_update = true
}