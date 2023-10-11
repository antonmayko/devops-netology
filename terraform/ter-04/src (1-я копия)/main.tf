
module "vpc" {
  source       = "./vpc"
  env_name     = var.vpc_name
  zone = var.default_zone
  cidr = var.default_cidr
}

module "test-vm" {
  source          = "./vm1"
  name        = var.vm_name
#  network_id      = yandex_vpc_network.develop.id
  subnet_id      = module.vpc.vpc_subnet_id
  image_family    = var.vm_image_family
  ssh-keys = local.ssh-key
}
