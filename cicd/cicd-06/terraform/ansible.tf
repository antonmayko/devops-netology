resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { centosservers =  yandex_compute_instance.gitlab_vms
      })

  filename = "${abspath(path.module)}/hosts.cfg"
}

