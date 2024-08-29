# Дипломный практикум в Yandex.Cloud

## Цели:

1. Подготовить облачную инфраструктуру на базе облачного провайдера Яндекс.Облако.
2. Запустить и сконфигурировать Kubernetes кластер.
3. Установить и настроить систему мониторинга.
4. Настроить и автоматизировать сборку тестового приложения с использованием Docker-контейнеров.
5. Настроить CI для автоматической сборки и тестирования.
6. Настроить CD для автоматического развёртывания приложения.

---
## Этапы выполнения:


### Создание облачной инфраструктуры

С помощью Terraform подготовим backend для хранения `.tfstate` основной конфигурации Terraform.  
   
Был выбран S3 bucket в Яндекс облаке. Его [конфигурация](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/backend)

Далее с помощью Terraform разворачиваем инфраструктуру в виде 4-х ВМ. Для экономии денежных средств  ВМ сделаны прерываемыми.

[Конфигурация основной инфраструктуры](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/vms)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/4vms.png )


---
### Создание Kubernetes кластера

Было принято решение развернуть Kubernetes кластер с помощью 
[ansible конфигурации Kubespray](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/vms/kubespray).

Конфигурационный файл со списком нод [hosts.yaml](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/vms/kubespray/inventory/mycluster/hosts.yaml)
генерируется с помощью Terraform при развертывании инфраструктуры. 

Команда `kubectl get pods --all-namespaces` отрабатывает без ошибок.

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/all-namespaces.png)


---
### Создание тестового приложения

Создаем отдельный git репозиторий [testapp](https://github.com/antonmayko/testapp)

Он содержит html страницу со статическим содержимым, а также Dockerfile для создания образа приложения.

Собрираемый docker образ располагается в реестре DockerHub `antonmayko/nginx` 

---
### Подготовка cистемы мониторинга и деплой приложения

Устанавливаем в кластер систему мониторинга [kube-prometheus](https://github.com/prometheus-operator/kube-prometheus) 
для отслеживания основных метрик Kubernetes. Его конфигурационные находятся [здесь](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/kube-prometheus) 

Дашборды в grafana, отображающие состояние Kubernetes кластера:

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/grafana1.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/grafana2.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/grafana3.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/grafana4.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/grafana5.png)

Деплоим тестовое приложение - веб сервер, отдающий статическую страницу.

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/deployapp.png)

Манифесты деплоя и сервиса лежат [здесь](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/k8s-manifests).

Http доступ к тестовому приложению:

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/httpaccess.png)


---
### Установка и настройка CI/CD

Осталось настроить ci/cd систему для автоматической сборки docker образа и деплоя приложения при изменении кода.

Для сборки и деплоя выбран `GitHub Actions`.

При любом коммите в репозиторий с тестовым приложением происходит сборка Docker образа и отправка его в реестр DockerHub.

[Сценарий](https://github.com/antonmayko/testapp/blob/main/.github/workflows/build-push.yml) GitHub Actions.

При создании тега в формате v1.x.x происходит сборка docker образа, отправка в реестр DockerHub,
а также деплой соответствующего Docker образа в кластер Kubernetes.

[Сценарий](https://github.com/antonmayko/testapp/blob/main/.github/workflows/build-push-deploy.yml) GitHub Actions.

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/commit.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/app.png)

![photo](https://github.com/antonmayko/devops-netology/blob/diplom-01/diplom/assets/dockerhub.png)