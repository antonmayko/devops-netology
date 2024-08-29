data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
}

resource "yandex_compute_instance" "node_vms" {
  name        = "node${count.index+1}"
  hostname    = "node${count.index+1}"
  platform_id = var.vm_platform_id

  count = var.node_wms_count

  resources {
    cores         = var.cpu_cores_count
    memory        = var.ram_size
    core_fraction = var.cpu_core_fract
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type = var.hard_disk_type
      size = var.boot_disk_size
    }
  }

  metadata = {
    user-data = data.template_file.cloudinit.rendered
    ssh-keys = local.ssh-key
  }

  scheduling_policy { preemptible = true }

  network_interface {
    subnet_id = yandex_vpc_subnet.vpc_subnet.id
    nat       = true
  }
  allow_stopping_for_update = true
}