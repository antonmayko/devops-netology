# Домашнее задание к занятию «Запуск приложений в K8S»

------

### Задание 1. Создать Deployment и обеспечить доступ к репликам приложения из другого Pod

1. Создать Deployment приложения, состоящего из двух контейнеров — nginx и multitool. Решить возникшую ошибку.
2. После запуска увеличить количество реплик работающего приложения до 2.
3. Продемонстрировать количество подов до и после масштабирования.
4. Создать Service, который обеспечит доступ до реплик приложений из п.1.
5. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложений из п.1.

Ответ:
- манифест deployment
[deploy1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/task1/deploy1.yaml)
- манифест service
[service1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/task1/service1.yaml)
- манифест отдельного pod
[pod-multitool.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/task1/pod-multitool.yaml)

Деплой одной реплики

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/1dep.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/1pod.png)

Конфигурируем две реплики

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/2pod.png)

Создаем сервис

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/service.png)

Создаем отдельный под и запускаем `curl`

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/single-pod.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets1/curl-result.png)

------

### Задание 2. Создать Deployment и обеспечить старт основного контейнера при выполнении условий

1. Создать Deployment приложения nginx и обеспечить старт контейнера только после того, как будет запущен сервис этого приложения.
2. Убедиться, что nginx не стартует. В качестве Init-контейнера взять busybox.
3. Создать и запустить Service. Убедиться, что Init запустился.
4. Продемонстрировать состояние пода до и после запуска сервиса.

Ответ:
- манифест deployment
[deploy2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/task2/deploy2.yaml)
- манифест service
[service2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/task2/service2.yaml)

Создаем деплой, под не запущен. Создаем сервис. Под запускается.

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets2/deploy2.png)

Процесс запуска пода.

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-03/kuber/kuber-03/assets2/pod-status.png)

------
