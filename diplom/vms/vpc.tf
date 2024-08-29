resource "yandex_vpc_network" "vpc_network" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "vpc_subnet" {
  name           = var.subnet_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.vpc_network.id
  v4_cidr_blocks = var.default_cidr
}

