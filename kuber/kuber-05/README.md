# Домашнее задание к занятию «Сетевое взаимодействие в K8S. Часть 2»

------

### Задание 1. Создать Deployment приложений backend и frontend

1. Создать Deployment приложения _frontend_ из образа nginx с количеством реплик 3 шт.
2. Создать Deployment приложения _backend_ из образа multitool. 
3. Добавить Service, которые обеспечат доступ к обоим приложениям внутри кластера. 
4. Продемонстрировать, что приложения видят друг друга с помощью Service.
5. Предоставить манифесты Deployment и Service в решении, а также скриншоты или вывод команды п.4.

Ответ:
- манифест deployment frontend
[deploy-frontend.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/deploy-frontend.yaml)
- манифест deployment backend
[deploy-backend.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/deploy-backend.yaml)
- манифест service-frontend
[service-frontend.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/service-frontend.yaml)
- манифест service-backend
[service-backend.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/service-backend.yaml)

Созданные ресурсы:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/create-resources.png)

Поскольку `pod` фронтенда создан на основе образа `nginx`, в нем нет утилиты `curl`.
Для проверки доступности бекенда был создан тестовый `pod`  

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/test-pod.png)

Проверка доступности фронтенда из контейнера бекенда.

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/test-front.png)

------

### Задание 2. Создать Ingress и обеспечить доступ к приложениям снаружи кластера

1. Включить Ingress-controller в MicroK8S.
2. Создать Ingress, обеспечивающий доступ снаружи по IP-адресу кластера MicroK8S так, чтобы при запросе только по адресу открывался _frontend_ а при добавлении /api - _backend_.
3. Продемонстрировать доступ с помощью браузера или `curl` с локального компьютера.
4. Предоставить манифесты и скриншоты или вывод команды п.2.

Ответ:
- Ingress-controller был включен командой `microk8s enable ingress`
- манифест ingress
[ingress.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/ingress.yaml)

Результаты перехода по серому адресу ВМ в браузере:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/slash.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/slash-api.png)

Серый адрес ВМ:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-05/kuber/kuber-05/assets/ip.png)

