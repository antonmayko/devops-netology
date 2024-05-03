# Домашнее задание к занятию «Организация сети»

---

### Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать пустую VPC. Выбрать зону.
2. Публичная подсеть.
 - Создать в VPC subnet с названием public, сетью 192.168.10.0/24.
 - Создать в этой подсети NAT-инстанс, присвоив ему адрес 192.168.10.254. В качестве image_id использовать fd80mrhj8fl2oe87o4e1.
 - Создать в этой публичной подсети виртуалку с публичным IP, подключиться к ней и убедиться, что есть доступ к интернету.

Ответ:
- манифест для сетей и подсетей
[main.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/src/main.tf)
- манифест NAT инстанс
[nat-instance.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/src/nat-instance.tf)
- манифест ВМ с публичным IP
[vm-public.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/src/vm-public.tf)

Список созданных ВМ:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/assets/list.png)

Доступ в интернет из ВМ с публичным IP:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/assets/public.png)

3. Приватная подсеть.
 - Создать в VPC subnet с названием private, сетью 192.168.20.0/24.
 - Создать route table. Добавить статический маршрут, направляющий весь исходящий трафик private сети в NAT-инстанс.
 - Создать в этой приватной подсети виртуалку с внутренним IP, подключиться к ней через виртуалку, созданную ранее, и убедиться, что есть доступ к интернету.

Ответ:
- манифест для сетей и подсетей и таблицы маршрутизации
[main.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/src/main.tf)
- манифест ВМ без публичного IP
[vm-private.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/src/vm-private.tf)

Доступ в интернет из ВМ без публичного IP:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-01/cloudnet/cloudnet-01/assets/private.png)

---

