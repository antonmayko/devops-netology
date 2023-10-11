output "vm_external_ip_address" {
  value = yandex_compute_instance.vm1.network_interface.0.nat_ip_address
}