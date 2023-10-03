# Домашнее задание к занятию «Основы Terraform. Yandex Cloud»


## Задание 0

1. Ознакомьтесь с документацией к security-groups в Yandex Cloud.

Ответ: Выполнено.

2. Запросите preview-доступ к этому функционалу в личном кабинете Yandex Cloud. Обычно его выдают в течение 24-х часов. https://console.cloud.yandex.ru/folders/<ваш cloud_id>/vpc/security-groups.

Ответ: доступ имеется.

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/security-groups.png "security-groups")


## Задание 1

1. Изучите проект. В файле variables.tf объявлены переменные для Yandex provider.

Ответ: Файл [variables.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/variables.tf)

2. Переименуйте файл personal.auto.tfvars_example в personal.auto.tfvars. Заполните переменные: идентификаторы облака, токен доступа. Благодаря .gitignore этот файл не попадёт в публичный репозиторий. **Вы можете выбрать иной способ безопасно передать секретные данные в terraform.**

Ответ: Ссылку на файл `personal.auto.tfvars` дать не могу он находится в `.gitignore`.

Секреты решил брать из переменных окружения:

```
export YC_TOKEN=$(yc iam create-token)
export YC_CLOUD_ID=$(yc config get cloud-id)
export YC_FOLDER_ID=$(yc config get folder-id)

export TF_VAR_YC_TOKEN="$YC_TOKEN"
export TF_VAR_YC_CLOUD_ID="YC_CLOUD_ID"
export TF_VAR_YC_FOLDER_ID="$YC_FOLDER_ID"
```
В файле [variables.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/variables.tf) объявил их.

В файле [providers.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/providers.tf) использовал.

3. Сгенерируйте или используйте свой текущий ssh-ключ. Запишите его открытую часть в переменную **vms_ssh_root_key**.

Ответ: Выполнил как написано, но финальном коде открытый ключ находится в переменной `vms_metadata` в файле
[vms_platform.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/vms_platform.tf).

4. Инициализируйте проект, выполните код. Исправьте намеренно допущенные синтаксические ошибки. Ищите внимательно, посимвольно. Ответьте, в чём заключается их суть.

Ответ: 

- параметр `platform_id = "standart-v4"` не верный, версия 4 не существует. Выбираю `platform_id = "standard-v2"`

- число ядер CPU указано как 1   `cores = 1`. Надо поставить 2 или 4. Ставлю `cores = 2`

Результат выполнения кода после исправления ошибок:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm.png "yc_vm")

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/ssh_connect.png "ssh_connect")

5. Ответьте, как в процессе обучения могут пригодиться параметры ```preemptible = true``` и ```core_fraction=5``` в параметрах ВМ. Ответ в документации Yandex Cloud.

Ответ:

- `preemptible = true` - это политика планирования. Нужна, чтобы создать прерываемую виртуальную машину. Польза: данный тип ВМ останавливается через 24 часа.
Также этот тип ВМ имеет более низкую стоимость. Это полезно, чтобы не тратить лишние деньги при обучении.

- `core_fraction = 5` - это уровень доступности к физическим ядрам CPU. В данном примере как минимум 5% времени в течении каждой секунды. Этот параметр 
удешевляет стоимость созданного ресурса, и для обучения этого вполне достаточно.


## Задание 2

1. Изучите файлы проекта.

Ответ: Выполнено.

2. Замените все хардкод-**значения** для ресурсов **yandex_compute_image** и **yandex_compute_instance** на **отдельные** переменные. К названиям переменных ВМ добавьте в начало префикс **vm_web_** .  Пример: **vm_web_name**.

Ответ: [main.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/main.tf)

3. Объявите нужные переменные в файле variables.tf, обязательно указывайте тип переменной. Заполните их **default** прежними значениями из main.tf. 

Ответ: Выполнил как написано, но финальном коде эти переменные находятся в файле
[vms_platform.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/vms_platform.tf).

4. Проверьте terraform plan. Изменений быть не должно. 

Ответ: `terraform plan` изменений не выявил.


## Задание 3

1. Создайте в корне проекта файл 'vms_platform.tf' . Перенесите в него все переменные первой ВМ.

Ответ: Выполнил. [vms_platform.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/vms_platform.tf).

2. Скопируйте блок ресурса и создайте с его помощью вторую ВМ в файле main.tf: **"netology-develop-platform-db"** ,  cores  = 2, memory = 2, core_fraction = 20. Объявите её переменные с префиксом **vm_db_** в том же файле ('vms_platform.tf').

Ответ: Выполнил. [main.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/main.tf)

3. Примените изменения.

Ответ: Выполнил всё, согласно задания. Изменения применил:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_two.png "yc_vm_two")


## Задание 4

1. Объявите в файле outputs.tf output типа map, содержащий { instance_name = external_ip } для каждой из ВМ.

Ответ: Выполнил. [outputs.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/outputs.tf)

2. Примените изменения.

В качестве решения приложите вывод значений ip-адресов команды ```terraform output```.

Ответ: Изменения применил. Прикладываю вывод значений ip-адресов команды `terraform output`:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/ter_vm_ext_ips.png "ter_vm_ext_ips")

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_ext_ips.png "yc_vm_ext_ips")


## Задание 5

1. В файле locals.tf опишите в **одном** local-блоке имя каждой ВМ, используйте интерполяцию ${..} с несколькими переменными по примеру из лекции.

Ответ: Выполнил. [locals.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/locals.tf)

2. Замените переменные с именами ВМ из файла variables.tf на созданные вами local-переменные.

Ответ: Выполнил. Результат в файле [main.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/main.tf)

3. Примените изменения.

Ответ: Изменения применил. В виду того, что веб-интерфейс консоли Яндекса не отображает супердлинные имена, привожу скрин получившихся имен из текстовой консоли:

![alt-1](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/assets/yc_vm_names_locals.png "yc_vm_names_locals")


## Задание 6

1. Вместо использования трёх переменных  ".._cores",".._memory",".._core_fraction" в блоке  resources {...}, объедините их в переменные типа **map** с именами "vm_web_resources" и "vm_db_resources". В качестве продвинутой практики попробуйте создать одну map-переменную **vms_resources** и уже внутри неё конфиги обеих ВМ — вложенный map.

Ответ: Выполнил. Результат в файле [vms_platform.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/vms_platform.tf).

2. Также поступите с блоком **metadata {serial-port-enable, ssh-keys}**, эта переменная должна быть общая для всех ваших ВМ.

Ответ: Выполнил. Результат в файле [vms_platform.tf](https://github.com/antonmayko/devops-netology/blob/terraform-02/terraform/ter-02/src/vms_platform.tf).

3. Найдите и удалите все более не используемые переменные проекта.

Ответ: Выполнил. [Ссылка](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src) на проект.

4. Проверьте terraform plan. Изменений быть не должно.

Ответ: Проделал все шаги. `terraform plan` изменений не выявил.


## Задание 7*

Изучите содержимое файла console.tf. Откройте terraform console, выполните следующие задания: 

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

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/terraform-02/terraform/ter-02/src)