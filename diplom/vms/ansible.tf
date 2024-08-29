resource "local_file" "hosts_cfg" {
  content = templatefile("${path.module}/hosts.tftpl",

    { k8s =  yandex_compute_instance.node_vms})

#  filename = "${abspath(path.module)}/hosts.cfg"
  filename = "${abspath(path.module)}/kubespray/inventory/mycluster/hosts.yaml"
}

#resource "null_resource" "hosts_provision" {

#  depends_on = [yandex_compute_instance.node_vms]

  #Добавление ПРИВАТНОГО ssh ключа в ssh-agent
#  provisioner "local-exec" {
#    command = "cat ~/.ssh/id_rsa | ssh-add -"
#  }

#  provisioner "local-exec" {
#    command = "sleep 100"
#  }

#Запуск ansible-playbook
#  provisioner "local-exec" {
#    command  = "export ANSIBLE_HOST_KEY_CHECKING=False; ansible-playbook -i ${abspath(path.module)}/kubespray/inventory/mycluster/hosts.yaml --become --become-user=root ${abspath(path.module)}/kubespray/cluster.yml"
#    on_failure = continue #Продолжить выполнение terraform pipeline в случае ошибок
#    environment = { ANSIBLE_HOST_KEY_CHECKING = "False" }
#    #срабатывание триггера при изменении переменных
#  }
#    triggers = {
#      always_run         = "${timestamp()}" #всегда т.к. дата и время постоянно изменяются
#      playbook_src_hash  = file("${abspath(path.module)}/test.yml") # при изменении содержимого playbook файла
##      ssh_public_key     = var.public_key # при изменении переменной
#    }

#}