# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

------


### Задание 1

1. Изучите проект.
2. Заполните файл personal.auto.tfvars.
3. Инициализируйте проект, выполните код. Он выполнится, даже если доступа к preview нет.

Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud или скриншот отказа в предоставлении доступа к preview-версии.

Ответ:

![Ingress rules](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/assets/ingress.png )

------

### Задание 2

1. Создайте файл count-vm.tf. Опишите в нём создание двух **одинаковых** ВМ  web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент **count loop**. Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )

Ответ: [count-vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/count-vm.tf).
2. Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ с именами "main" и "replica" **разных** по cpu/ram/disk , используя мета-аргумент **for_each loop**. Используйте для обеих ВМ одну общую переменную типа list(object({ vm_name=string, cpu=number, ram=number, disk=number  })). При желании внесите в переменную все возможные параметры.

Ответ: [for_each-vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/for_each-vm.tf)
[variables.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-03/src/variables.tf)
3. ВМ из пункта 2.2 должны создаваться после создания ВМ из пункта 2.1.

Ответ: [for_each-vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/for_each-vm.tf)
4. Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.

Ответ: В ДЗ 2 мы вписывали SSH ключ тоже напрямую. Поэтому я не могу руководствоваться ДЗ 2.

Но решение есть: [locals.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/locals.tf)
[for_each-vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/for_each-vm.tf)
[count-vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/count-vm.tf)
5. Инициализируйте проект, выполните код.

Ответ: [Ссылка на код](https://github.com/antonmayko/devops-netology/tree/terraform-03/terraform/ter-03/src)

![task02-apply](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/assets/task02-apply.png )

![4vms](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/assets/4vms.png )

------

### Задание 3

1. Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле **disk_vm.tf** .
2. Создайте в том же файле **одиночную**(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage"  . Используйте блок **dynamic secondary_disk{..}** и мета-аргумент for_each для подключения созданных вами дополнительных дисков.

Ответ: [disk_vm.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/disk_vm.tf)

------

### Задание 4

1. В файле ansible.tf создайте inventory-файл для ansible.
Используйте функцию tepmplatefile и файл-шаблон для создания ansible inventory-файла из лекции.
Готовый код возьмите из демонстрации к лекции [**demonstration2**](https://github.com/netology-code/ter-homeworks/tree/main/03/demonstration2).
Передайте в него в качестве переменных группы виртуальных машин из задания 2.1, 2.2 и 3.2, т. е. 5 ВМ.

Ответ: [ansible.tf](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/src/ansible.tf)

2. Инвентарь должен содержать 3 группы [webservers], [databases], [storage] и быть динамическим, т. е. обработать как группу из 2-х ВМ, так и 999 ВМ.
3. Выполните код. Приложите скриншот получившегося файла. 

Ответ:

![hosts_cfg](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/assets/hosts_cfg.png )

![playbook](https://github.com/antonmayko/devops-netology/blob/terraform-03/terraform/ter-03/assets/playbook.png )

------

В git-репозитории, в котором было выполнено задание к занятию «Управляющие конструкции в коде Terraform», создал новую ветку `terraform-03`, закоммитил 
в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `terraform-03`.

Прикрепляю ссылку на свой финальный terraform-код, расположенный в ветке terraform-03. 

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/terraform-03/terraform/ter-03/src)


 