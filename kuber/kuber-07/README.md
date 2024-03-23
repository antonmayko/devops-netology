# Домашнее задание к занятию «Хранение в K8s. Часть 2»

### Цель задания

В тестовой среде Kubernetes нужно создать PV и продемонстрировать запись и хранение файлов.

------

### Задание 1

**Что нужно сделать**

Создать Deployment приложения, использующего локальный PV, созданный вручную.

1. Создать Deployment приложения, состоящего из контейнеров busybox и multitool.
2. Создать PV и PVC для подключения папки на локальной ноде, которая будет использована в поде.
3. Продемонстрировать, что multitool может читать файл, в который busybox пишет каждые пять секунд в общей директории. 
4. Удалить Deployment и PVC. Продемонстрировать, что после этого произошло с PV. Пояснить, почему.
5. Продемонстрировать, что файл сохранился на локальном диске ноды. Удалить PV.  Продемонстрировать что произошло с файлом после удаления PV. Пояснить, почему.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

Ответ:
- манифест deployment
[deploy1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/deploy1.yaml)
- манифест persistent volume claim
[pvc1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/pvc1.yaml)
- манифест persistent volume
[pv1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/pv1.yaml)

Чтение файла из контейнера multitool:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets1/read1.png)

Удаление Deployment и PVC:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets1/del-deploy-pvc.png)

После удаления вышеуказанных ресурсов статус PV изменился с Bound на Released. Потому что он больше не связан с PVC.

При этом файл сохранился на локальном диске ноды:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets1/file-from-node.png)

Удаляем объект PV. При этом файл на локальном диске ноды остался без изменений:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets1/file-from-node.png)

Причина: объект PV изначально был создан с политикой Retain. Это означает, что после удаления PV ресурсы из внешних
провайдеров автоматически не удаляются.

------

### Задание 2

**Что нужно сделать**

Создать Deployment приложения, которое может хранить файлы на NFS с динамическим созданием PV.

1. Включить и настроить NFS-сервер на MicroK8S.
2. Создать Deployment приложения состоящего из multitool, и подключить к нему PV, созданный автоматически на сервере NFS.
3. Продемонстрировать возможность чтения и записи файла изнутри пода. 
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

Ответ:
- манифест deployment
[deploy2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/deploy2.yaml)
- манифест persistent volume claim
[pvc2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/pvc2.yaml)
- манифест storage class
[storageclass-nfs.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/storageclass-nfs.yaml)

Созданный storage class:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets2/sc.png)

NFS контроллер:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets2/nfs.png)

Создание PVC:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets2/pvc2.png)

Создание Deployment:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets2/deploy2.png)

На фото выше видно, что после создания deployment был автоматически создан объект PV.

Чтение и запись файла изнутри пода:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-07/kuber/kuber-07/assets2/read-write.png)

------