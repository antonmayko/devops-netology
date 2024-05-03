
resource "yandex_compute_instance" "nat-instance" {
  name        = "nat-instance"
  platform_id = var.vm_platform_id


  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd80mrhj8fl2oe87o4e1"
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
    ip_address = "192.168.10.254"

  }
  allow_stopping_for_update = true
}