resource "yandex_compute_instance_group" "vm-group" {
  name                = "fixed-ig-with-balancer"
  folder_id           = var.folder_id
  service_account_id  = var.serviceaccount_id
  deletion_protection = "false"
  instance_template {
    platform_id = var.vm_platform_id
    resources {
      memory = var.resources.public.memory
      cores  = var.resources.public.cores
      core_fraction = var.resources.public.core_fraction
    }

    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd827b91d99psvq5fjit"
        type = var.hard_disk_type
        size = var.boot_disk_size
      }
    }

    network_interface {
      network_id         = "${yandex_vpc_network.netology_vpc.id}"
      subnet_ids         = ["${yandex_vpc_subnet.public.id}"]
#      security_group_ids = ["<список_идентификаторов_групп_безопасности>"]
    }

    metadata = {
      user-data = data.template_file.cloudinit.rendered
      ssh-keys = local.ssh-key
    }
  }

  scale_policy {
    fixed_scale {
      size = var.vm_scale
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "Целевая группа Network Load Balancer"
  }
}

data "template_file" "cloudinit" {
 template = file("./cloud-init.yml")
}