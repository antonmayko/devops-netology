#output "internal_ip_address" {
#  value = "${yandex_compute_instance.centos_vms.network_interface.0.ip_address}"
#}

#output "external_ip_address" {
# value = tolist({
#    for name, ip in yandex_compute_instance.centos_vms[*] : name => ip.0.nat_ip_address})
#}
