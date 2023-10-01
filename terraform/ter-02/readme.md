# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»


## Задание 0

Это задание не предполагает ответа, но я его дам:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/security-groups.png "security-groups")


## Задание 1

Секретики решил брать из переменных окружения:

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

export TF_VAR_YC_TOKEN="$YC_TOKEN"
export TF_VAR_YC_CLOUD_ID="YC_CLOUD_ID"
export TF_VAR_YC_FOLDER_ID="$YC_FOLDER_ID"
```

В файле `variables.tf` объявил их:

```
variable "YC_TOKEN" {}
variable "YC_CLOUD_ID" {}
variable "YC_FOLDER_ID" {}
```

В файле `providers.tf` применил их:

```
provider "yandex" {
  token     = var.YC_TOKEN
  cloud_id  = var.YC_CLOUD_ID
  folder_id = var.YC_FOLDER_ID
  zone      = var.default_zone
}
```

При выполнении вылезли ошибки:

- параметр `platform_id = "standart-v4"` не верный, версия 4 не существует. Выбираю `platform_id = "standard-v2"`

- число ядер CPU указано как 1   `cores = 1`. Надо поставить 2 или 4. Ставлю `cores = 2`


Ответьте, как в процессе обучения могут пригодиться параметры preemptible = true и core_fraction=5 в параметрах ВМ.

- `preemptible = true` - это политика планирования. Нужна, чтобы создать прерываемую виртуальную машину. Польза: данный тип ВМ останавливается через 24 часа.
Также этот тип ВМ имеет более низкую стоимость. Это полезно, чтобы не тратить лишние деньги при обучении.

- `core_fraction = 5` - это уровень доступности к физическим ядрам CPU. В данном примере как минимум 5% времени в течении каждой секунды. Этот параметр 
удешевляет стоимость созданного ресурса, и для обучения этого вполне достаточно.

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm.png "yc_vm")

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/ssh_connect.png "ssh_connect")


Согласно "[Правил приёма работы](https://github.com/netology-code/ter-homeworks/blob/main/02/hw-02.md#правила-приёма-работы)" прикрепляю ссылку на 
terraform-код в git, расположенный в ветке terraform-02. Вот эта [ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)

Обращаю Ваше внимание на то, что согласно "Правил приёма работ" по ссылке выше находится именно финальный код, 
потому что указания прислать промежуточный код в задании 1 нет.


## Задание 2

`terraform plan` Изменений не выявил.

Согласно "[Правил приёма работы](https://github.com/netology-code/ter-homeworks/blob/main/02/hw-02.md#правила-приёма-работы)" прикрепляю ссылку на 
terraform-код в git, расположенный в ветке terraform-02. Вот эта [ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)

Обращаю Ваше внимание на то, что согласно "Правил приёма работ" по ссылке выше находится именно финальный код, 
потому что указания прислать промежуточный код в задании 2 нет.


## Задание 3

Выполнил всё, согласно задания. Изменения применил.

Не смотря на то, что подтверждение выполнения этого задания не требуется, рискну все-таки приложить фото с результатом выполнения задания:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_two.png "yc_vm_two")


Согласно "[Правил приёма работы](https://github.com/netology-code/ter-homeworks/blob/main/02/hw-02.md#правила-приёма-работы)" прикрепляю ссылку на 
terraform-код в git, расположенный в ветке terraform-02. Вот эта [ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)

Обращаю Ваше внимание на то, что согласно "Правил приёма работ" по ссылке выше находится именно финальный код, 
потому что указания прислать промежуточный код в задании 3 нет.


## Задание 4

Выполнил всё, согласно задания. Изменения применил.

Прикладываю вывод значений ip-адресов команды `terraform output`:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/ter_vm_ext_ips.png "ter_vm_ext_ips")

Скрин, подтверждающий, что всё происходило на самом деле:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_ext_ips.png "yc_vm_ext_ips")


## Задание 5

Выполнил всё, согласно задания. Изменения применил.

Не смотря на то, что подтверждение выполнения этого задания не требуется, рискну все-таки приложить фото с результатом выполнения задания.

Примечание: В виду того, что веб-интерфейс консоли Яндекса не отображает супердлинные имена, привожу скрин получившихся имен из обычной консоли:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_names_locals.png "yc_vm_names_locals")

Согласно "[Правил приёма работы](https://github.com/netology-code/ter-homeworks/blob/main/02/hw-02.md#правила-приёма-работы)" прикрепляю ссылку на 
terraform-код в git, расположенный в ветке terraform-02. Вот эта [ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)

Обращаю Ваше внимание на то, что согласно "Правил приёма работ" по ссылке выше находится именно финальный код, 
потому что указания прислать промежуточный код в задании 5 нет.


## Задание 6

Проделал все шаги. `terraform plan` изменений не выявил.

Согласно "[Правил приёма работы](https://github.com/netology-code/ter-homeworks/blob/main/02/hw-02.md#правила-приёма-работы)" прикрепляю ссылку на 
terraform-код в git, расположенный в ветке terraform-02. Вот эта [ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)

Обращаю Ваше внимание на то, что согласно "Правил приёма работ" по ссылке выше находится именно финальный код, 
потому что указания прислать промежуточный код в задании 6 нет.


## Задание 7

- Напишите, какой командой можно отобразить второй элемент списка test_list.

```
> local.test_list.1
"staging"
```

- Найдите длину списка test_list с помощью функции length(<имя переменной>).

```
> length(local.test_list)
3
```

- Напишите, какой командой можно отобразить значение ключа admin из map test_map.

```
> local.test_map.admin
"John"
```

- Напишите interpolation-выражение, результатом которого будет: 
"John is admin for production server based on OS ubuntu-20-04 with X vcpu, Y ram and Z virtual disks", 
используйте данные из переменных test_list, test_map, servers и функцию length() для подстановки значений.

```
> "${local.test_map.admin} is admin for ${local.test_list.2} server based on OS ${local.servers.production.image} with ${local.servers.production.cpu} vcpu, ${local.servers.production.ram} ram and ${length(local.servers.production.disks)} virtual disks"

"John is admin for production server based on OS ubuntu-20-04 with 10 vcpu, 40 ram and 4 virtual disks"
```

------

В git-репозитории, в котором было выполнено задание к занятию «Введение в Terraform», создал новую ветку `terraform-02`, закоммитил 
в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `terraform-02`.

Прикрепляю ссылку на свой финальный terraform-код, расположенный в ветке terraform-02. 

[ССЫЛКА!](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)