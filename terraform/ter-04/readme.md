# Домашнее задание к занятию «Продвинутые методы работы с Terraform»

------

### Задание 1

1. Возьмите из [демонстрации к лекции готовый код](https://github.com/netology-code/ter-homeworks/tree/main/04/demonstration1) для создания ВМ с помощью remote-модуля.
2. Создайте одну ВМ, используя этот модуль. В файле cloud-init.yml необходимо использовать переменную для ssh-ключа вместо хардкода. Передайте ssh-ключ в функцию template_file в блоке vars ={} .
Воспользуйтесь [**примером**](https://grantorchard.com/dynamic-cloudinit-content-with-terraform-file-templates/). Обратите внимание, что ssh-authorized-keys принимает в себя список, а не строку.
3. Добавьте в файл cloud-init.yml установку nginx.
4. Предоставьте скриншот подключения к консоли и вывод команды ```sudo nginx -t```.

Ответ: файл [cloud-init.yml](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/demonstration1/cloud-init.yml)

![nginx](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/nginx.png)

------

### Задание 2

1. Напишите локальный модуль vpc, который будет создавать 2 ресурса: **одну** сеть и **одну** подсеть в зоне, объявленной при вызове модуля, например: ```ru-central1-a```.
2. Вы должны передать в модуль переменные с названием сети, zone и v4_cidr_blocks.
3. Модуль должен возвращать в root module с помощью output информацию о yandex_vpc_subnet. Пришлите скриншот информации из terraform console о своем модуле. Пример: > module.vpc_dev  

Ответ: 

![module-vpc](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/module-vpc.png)

4. Замените ресурсы yandex_vpc_network и yandex_vpc_subnet созданным модулем. Не забудьте передать необходимые параметры сети из модуля vpc в модуль с виртуальной машиной.

Ответ: Передача описана в файле  [main.tf](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/src/main.tf)

5. Откройте terraform console и предоставьте скриншот содержимого модуля. Пример: > module.vpc_dev.

Ответ: ![module-vpc2](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/module-vpc2.png)

6. Сгенерируйте документацию к модулю с помощью terraform-docs.    
 

Ответ: Документация [doc.md](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/src/doc.md) 

### Задание 3
1. Выведите список ресурсов в стейте.

Ответ:

![state-list](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/state-list.png)

2. Полностью удалите из стейта модуль vpc.

Ответ:

![rm-vpc](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/rm-vpc.png)

3. Полностью удалите из стейта модуль vm.

Ответ:

![rm-vm](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/rm-vm.png)

4. Импортируйте всё обратно. Проверьте terraform plan. Изменений быть не должно.
Приложите список выполненных команд и скриншоты процессы.

Ответ:

![import-vm](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/import-vm.png)

![import-vpc](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/import-vpc.png)

![t-plan](https://github.com/antonmayko/devops-netology/blob/terraform-04/terraform/ter-04/assets/t-plan.png)

Поскольку мы должны создавать только прерываемые ВМ. "терраформ план" обновит таймаут ВМ. В остальном изменений нет. 

------

В git-репозитории, в котором было выполнено задание к занятию «Продвинутые методы работы с Terraform», создал новую ветку `terraform-04`, закоммитил 
в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `terraform-04`.

Прикрепляю ссылку на свой финальный terraform-код, расположенный в ветке terraform-04. 

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/terraform-04/terraform/ter-04/src)

