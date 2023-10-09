
resource "yandex_compute_instance" "db_vms" {
  depends_on = [yandex_compute_instance.web_vms]
  for_each = {
    0 = "main"
    1 = "replica"
  }
  name        = var.db_resources[each.key].vm_name
  platform_id = "standard-v2"

  resources {
    cores  = var.db_resources[each.key].cpu
    memory = var.db_resources[each.key].ram
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = "network-hdd"
      size = var.db_resources[each.key].disk
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