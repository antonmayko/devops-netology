# Домашнее задание к занятию «Конфигурация приложений»

### Цель задания

В тестовой среде Kubernetes необходимо создать конфигурацию и продемонстрировать работу приложения.

------

### Инструменты и дополнительные материалы, которые пригодятся для выполнения задания

1. [Описание](https://kubernetes.io/docs/concepts/configuration/secret/) Secret.
2. [Описание](https://kubernetes.io/docs/concepts/configuration/configmap/) ConfigMap.
3. [Описание](https://github.com/wbitt/Network-MultiTool) Multitool.

------

### Задание 1. Создать Deployment приложения и решить возникшую проблему с помощью ConfigMap. Добавить веб-страницу

1. Создать Deployment приложения, состоящего из контейнеров nginx и multitool.
2. Решить возникшую проблему с помощью ConfigMap.
3. Продемонстрировать, что pod стартовал и оба контейнера работают.
4. Сделать простую веб-страницу и подключить её к Nginx с помощью ConfigMap. Подключить Service и показать вывод curl или в браузере.
5. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

Ответ:
- манифест deployment
[deploy1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task1/deploy1.yaml)
- манифест configmap
[configmap1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task1/configmap1.yaml)
- манифест service
[service1.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task1/service1.yaml)

pod стартовал и оба контейнера работают:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/assets1/start-pod.png)

Страница в браузере:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/assets1/page.png)

------

### Задание 2. Создать приложение с вашей веб-страницей, доступной по HTTPS 

1. Создать Deployment приложения, состоящего из Nginx.
2. Создать собственную веб-страницу и подключить её как ConfigMap к приложению.
3. Выпустить самоподписной сертификат SSL. Создать Secret для использования сертификата.
4. Создать Ingress и необходимый Service, подключить к нему SSL в вид. Продемонстрировать доступ к приложению по HTTPS. 
4. Предоставить манифесты, а также скриншоты или вывод необходимых команд.

Ответ:
- манифест deployment
[deploy2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task2/deploy2.yaml)
- манифест configmap
[configmap2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task2/configmap2.yaml)
- манифест service
[service2.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task2/service2.yaml)
- манифест ingress
[ingress.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/task2/ingress.yaml)

Создание секрета:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/assets2/secret.png)

Страница в браузере:

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/assets2/https1.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-08/kuber/kuber-08/assets2/https2.png)

------