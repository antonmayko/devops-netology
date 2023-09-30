output "vm_external_ip_address" {
  value = { vm_web = yandex_compute_instance.platform.network_interface.0.nat_ip_address,
            vm_db = yandex_compute_instance.platform2.network_interface.0.nat_ip_address}
}

