
resource "yandex_compute_instance" "centos_vms" {
  for_each = {
    0 = "vm1"
    1 = "vm2"
  }
  name        = var.vm_resources[each.key].vm_name
  hostname    = var.vm_resources[each.key].vm_name
  platform_id = var.vm_platform_id

  resources {
    cores  = var.vm_resources[each.key].cpu
    memory = var.vm_resources[each.key].ram
    core_fraction = var.cpu_core_fract
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.centos.image_id
      type = var.hard_disk_type
      size = var.vm_resources[each.key].disk
    }
  }

  metadata = {
    ssh-keys = local.ssh-key
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }
  allow_stopping_for_update = true
}