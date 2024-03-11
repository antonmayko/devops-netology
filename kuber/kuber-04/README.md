# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 1»

------

### Задание 1. Создать Deployment и обеспечить доступ к контейнерам приложения по разным портам из другого Pod внутри кластера

1. Создать Deployment приложения, состоящего из двух контейнеров (nginx и multitool), с количеством реплик 3 шт.
2. Создать Service, который обеспечит доступ внутри кластера до контейнеров приложения из п.1 по порту 9001 — nginx 80, по 9002 — multitool 8080.
3. Создать отдельный Pod с приложением multitool и убедиться с помощью `curl`, что из пода есть доступ до приложения из п.1 по разным портам в разные контейнеры.
4. Продемонстрировать доступ с помощью `curl` по доменному имени сервиса.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

Ответ:
- манифест deployment
[deploy.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/deploy.yaml)
- манифест service1 - внутренний сервис
[service1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/service1.yaml)
- манифест отдельного pod
[pod-multitool.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/pod-multitool.yaml)

Создание деплоя и сервиса 

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/create-dep-svc1.png)

Создание тестового пода 

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/create-pod.png)

Тесты портов 9001 и 9002

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/testport-9001.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/testport-9002.png)


------

### Задание 2. Создать Service и обеспечить доступ к приложениям снаружи кластера

1. Создать отдельный Service приложения из Задания 1 с возможностью доступа снаружи кластера к nginx, используя тип NodePort.
2. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
3. Предоставить манифест Service в решении, а также скриншоты или вывод команды п.2.

Ответ:
- манифест service2 - сервис для доступа снаружи
[service2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/service2.yaml)

Создание второго сервиса 

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/create-svc2.png)

Тесты портов 9001 и 9002 из браузера

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/testport-9001-web.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-04/kuber/kuber-04/assets/testport-9002-web.png)

