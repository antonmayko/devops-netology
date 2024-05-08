# Создание сети
resource "yandex_vpc_network" "netology_vpc" {
  name = var.vpc_name
}

# Создание подсетей
resource "yandex_vpc_subnet" "public" {
  name           = var.subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.netology_vpc.id
  v4_cidr_blocks = var.subnet_cidr
}
