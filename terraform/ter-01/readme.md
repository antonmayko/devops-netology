# Домашнее задание к занятию «Введение в Terraform»


## Чек-лист готовности к домашнему заданию

- Скачайте и установите актуальную версию Terraform >=1.4.X . Приложите скриншот вывода команды terraform --version.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/terraform-version.png "terraform-version")

- Убедитесь, что в вашей ОС установлен docker.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/docker-version.png "docker-version")

- Зарегистрируйте аккаунт на сайте https://hub.docker.com/, выполните команду docker login и введите логин, пароль.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/docker-login.png "docker-login") 


## Задание 1

- Перейдите в каталог src. Скачайте все необходимые зависимости, использованные в проекте.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/terraform-depends.png "terraform-depends")

- Изучите файл .gitignore. В каком terraform-файле, согласно этому .gitignore, допустимо сохранить личную, секретную информацию?

Ответ: файл personal.auto.tfvars

- Выполните код проекта. Найдите в state-файле секретное содержимое созданного ресурса random_password, пришлите в качестве ответа конкретный ключ и его значение.

Ответ: "result": "eu3r4mLdfzrauuJB"

- Раскомментируйте блок кода, примерно расположенный на строчках 29–42 файла main.tf. Выполните команду terraform validate. Объясните, в чём заключаются намеренно допущенные ошибки. Исправьте их.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/terraform-validate-error.png "terraform-validate-error")

1. Ресурсу с типом docker_image не задано имя.

2. Имя ресурса не может начинаться с цифры.

3. В строке: `name  = "example_${random_password.random_string_FAKE.resulT}"`

Имя `random_string_FAKE` неверное. Правильно `random_string`

Параметр `resulT` должен быть записан, как `result`.

Тераформу, как и линуксу, не наплевать на регистр букв). 

- Выполните код. В качестве ответа приложите: исправленный фрагмент кода и вывод команды docker ps.

```
resource "docker_image" "nginx"{
  name         = "nginx:latest"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  name  = "example_${random_password.random_string.result}"

  ports {
    internal = 80
    external = 8000
  }
}
```

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/docker-ps.png "docker-ps")

- Замените имя docker-контейнера в блоке кода на hello_world. 
Не перепутайте имя контейнера и имя образа. Мы всё ещё продолжаем использовать name = "nginx:latest". 
Выполните команду terraform apply -auto-approve. Объясните своими словами, в чём может быть опасность применения ключа -auto-approve. 
В качестве ответа дополнительно приложите вывод команды docker ps.

Ответ: этот ключ автоматически подтверждает наши действия, снижая тем самым контроль на процессом изменения инфраструктуры. Более разумно выполнить 
`terraform plan` и `terraform apply`. Это снизит вероятность совершить ошибку.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/hello-world.png "hello-world")

- Уничтожьте созданные ресурсы с помощью terraform. Убедитесь, что все ресурсы удалены. Приложите содержимое файла terraform.tfstate.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/terraform-destroy1.png "terraform-destroy1")

terraform.tfstate

```
{
  "version": 4,
  "terraform_version": "1.5.7",
  "serial": 16,
  "lineage": "c1fd6470-bcbd-2ee6-18cf-c39c7186b38f",
  "outputs": {},
  "resources": [],
  "check_results": null
}
```

- Объясните, почему при этом не был удалён docker-образ nginx:latest. 
Ответ обязательно подкрепите строчкой из документации terraform провайдера docker.

keep_locally (Boolean) If true, then the Docker image won't be deleted on destroy operation. 
If this is false, it will delete the image from the docker local storage on destroy operation.

Параметр `keep_locally = true` говорит терраформу не удалять Docker-образ при выполнении операции уничтожения ресурса.

Поэтому образ удален не был.


## Задание 2

- Изучите в документации provider Virtualbox от shekeriev.

- Создайте с его помощью любую виртуальную машину.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/terraform-plan.png "terraform-plan")

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/running-vm.png "running-vm")

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/terraform/ter-01/assets/vm-info.png "vm-info")


