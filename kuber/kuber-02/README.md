# Домашнее задание к занятию «Базовые объекты K8S»

------

### Задание 1. Создать Pod с именем hello-world

1. Создать манифест (yaml-конфигурацию) Pod.
2. Использовать image - gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Подключиться локально к Pod с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

Ответ: 
манифест 
[pod-helloworld.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/pod-helloworld.yaml)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/assets/podhelloworld.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/assets/podhelloworld-forward.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/assets/podhelloworld-result.png)


### Задание 2. Создать Service и подключить его к Pod

1. Создать Pod с именем netology-web.
2. Использовать image — gcr.io/kubernetes-e2e-test-images/echoserver:2.2.
3. Создать Service с именем netology-svc и подключить к netology-web.
4. Подключиться локально к Service с помощью `kubectl port-forward` и вывести значение (curl или в браузере).

Ответ: 

- манифест pod
[pod-netology-web.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/pod-netology-web.yaml)
- манифест service
[service-netology-svc.yaml](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/service-netology-svc.yaml)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/assets/netology-web-svc.png)

![kuber](https://github.com/antonmayko/devops-netology/blob/kuber-02/kuber/kuber-02/assets/netology-result.png)

------
