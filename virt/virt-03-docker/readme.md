# Домашнее задание к занятию 3. "Введение. Экосистема. Архитектура. Жизненный цикл Docker-контейнера"


## Задача 1
 
### Форк nginx

[Ссылка] (https://hub.docker.com/r/antonmayko/nginx/tags)


## Задача 2


### Посмотрите на сценарий ниже и ответьте на вопрос: "Подходит ли в этом сценарии использование Docker-контейнеров или лучше подойдёт виртуальная машина, физическая машина? Может быть, возможны разные варианты?"

- высоконагруженное монолитное Java веб-приложение - для высокой нагрузки лучше подойдет физ. сервер или полная виртуализвация. Т.к. они обеспечивают максимально прямой доступ к вычислительным ресурсам.
- Nodejs веб-приложение - думаю, что для это сценария подойдет контейнер, т.к. для его запуска достаточно упрощенной версии Linux. 
- мобильное приложение c версиями для Android и iOS - для использования разных ОС контейнер не подойдет, высоконагруженности нет. Подойдет виртуальная машина.
- шина данных на базе Apache Kafka - Апач прекрасно работает в Linux, контейнеры Docker тоже. Если это не высоконагруженный процесс, то контейнер подходит.
- Elasticsearch-кластер для реализации логирования продуктивного веб-приложения — три ноды elasticsearch, два logstash и две ноды kibana; - 
Предположу, что всё это добро должно работать в виртуальных машинах на разных физических серверах. Ну чтобы понадежнее было.
- мониторинг-стек на базе Prometheus и Grafana - тут есть зависимость от количества собираемых метрик, количества опрашиваемых узлов и т.д.
Как и в любом мониторинге. Если количество объектов мониторинга невелико, то можно поместиться и в контейнер. В противном случае нужно смотреть в сторону полноценной виртуализации.
- MongoDB как основное хранилище данных для Java-приложения - Мне сложно дать однозначный ответ. Такую БД запускают даже под Windows. На докер хабе
также есть контейнер MongoDB. Получается подходит и контейнер, и ВМ, и физ. сервер. Всё зависит от конкретной задачи и технических возможностей предприятия.
- Gitlab-сервер для реализации CI/CD-процессов и приватный (закрытый) Docker Registry - Отдельный сервер подойдет. Также подойдет и виртуальная машина.
Но есть в этих вариантах ньюанс - нужно знать объемы хранения данных, и по всей видимости они будут не маленькие. Это нужно особенно учитывать для виртуальной машины.



## Задача 3

- Запустите первый контейнер из образа `centos` c любым тегом в фоновом режиме, подключив папку `/data` из текущей рабочей директории на хостовой машине в `/data` контейнера.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/virt/virt-03-docker/images/cont_centos.png "cont_centos")

- Запустите второй контейнер из образа `debian` в фоновом режиме, подключив папку `/data` из текущей рабочей директории на хостовой машине в `/data` контейнера.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/virt/virt-03-docker/images/cont_debian.png "cont_debian")

- Подключитесь к первому контейнеру с помощью `docker exec` и создайте текстовый файл любого содержания в `/data`.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/virt/virt-03-docker/images/create_file_centos.png "create_file_centos")

- Добавьте ещё один файл в папку `/data` на хостовой машине.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/virt/virt-03-docker/images/create_file_host.png "create_file_host")

- Подключитесь во второй контейнер и отобразите листинг и содержание файлов в `/data` контейнера.

![alt-1](https://github.com/antonmayko/devops-netology/blob/main/virt/virt-03-docker/images/file_list_debian.png "file_list_debian")

