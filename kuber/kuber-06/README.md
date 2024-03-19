# Домашнее задание к занятию «Хранение в K8s. Часть 1»

### Цель задания

В тестовой среде Kubernetes нужно обеспечить обмен файлами между контейнерам пода и доступ к логам ноды.

------

### Задание 1 

**Что нужно сделать**

Создать Deployment приложения, состоящего из двух контейнеров и обменивающихся данными.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Сделать так, чтобы busybox писал каждые пять секунд в некий файл в общей директории.
3. Обеспечить возможность чтения файла контейнером multitool.
4. Продемонстрировать, что multitool может читать файл, который периодически обновляется.
5. Предоставить манифесты Deployment в решении, а также скриншоты или вывод команды из п. 4.


Ответ:
- манифест Deployment (контейнер `busybox`записывает в файл текущую дату и время)
[deploy.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-06/kuber/kuber-06/deploy.yaml)

- демонстрация:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-06/kuber/kuber-06/assets/task1.png)

------

### Задание 2

**Что нужно сделать**

Создать DaemonSet приложения, которое может прочитать логи ноды.

1. Создать DaemonSet приложения, состоящего из multitool.
2. Обеспечить возможность чтения файла `/var/log/syslog` кластера MicroK8S.
3. Продемонстрировать возможность чтения файла изнутри пода.
4. Предоставить манифесты Deployment, а также скриншоты или вывод команды из п. 2.

Ответ:
- манифест DaemonSet
[daemonset.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-06/kuber/kuber-06/daemonset.yaml)

- демонстрация чтения файла лога:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-06/kuber/kuber-06/assets/task2.png)

------
