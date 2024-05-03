# Создание сети
resource "yandex_vpc_network" "netology_vpc" {
  name = var.vpc_name
}

# Создание подсетей
resource "yandex_vpc_subnet" "public" {
  name           = var.subnet_name1
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology_vpc.id
  v4_cidr_blocks = var.subnet_cidr1
}

resource "yandex_vpc_subnet" "private" {
  name           = var.subnet_name2
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology_vpc.id
  v4_cidr_blocks = var.subnet_cidr2
  route_table_id = yandex_vpc_route_table.nat-instance-route.id
}

# Создание таблицы маршрутизации и статического маршрута
resource "yandex_vpc_route_table" "nat-instance-route" {
  name       = "nat-instance-route"
  network_id = yandex_vpc_network.netology_vpc.id
  static_route {
    destination_prefix = "0.0.0.0/0"
    next_hop_address   = yandex_compute_instance.nat-instance.network_interface.0.ip_address
  }
}


data "yandex_compute_image" "ubuntu" {
  family = var.vm_image_family
}

#resource "yandex_compute_image" "nat-instance-ubuntu" {
#  source_family = "nat-instance-ubuntu"
#}