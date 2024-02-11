# Домашнее задание к занятию 14 «Средство визуализации Grafana»

---
### Задание 1

1. Используя директорию [help](./help) внутри этого домашнего задания, запустите связку prometheus-grafana.
1. Зайдите в веб-интерфейс grafana, используя авторизационные данные, указанные в манифесте docker-compose.
1. Подключите поднятый вами prometheus, как источник данных.
1. Решение домашнего задания — скриншот веб-интерфейса grafana со списком подключенных Datasource.

Ответ:

![datasource](https://github.com/antonmayko/devops-netology/blob/mon-02/mon/mon-02/assets/datasource.png)
## Задание 2

Изучите самостоятельно ресурсы:

1. [PromQL tutorial for beginners and humans](https://valyala.medium.com/promql-tutorial-for-beginners-9ab455142085).
1. [Understanding Machine CPU usage](https://www.robustperception.io/understanding-machine-cpu-usage).
1. [Introduction to PromQL, the Prometheus query language](https://grafana.com/blog/2020/02/04/introduction-to-promql-the-prometheus-query-language/).

Создайте Dashboard и в ней создайте Panels:

- утилизация CPU для nodeexporter (в процентах, 100-idle);

`100 - rate(node_cpu_seconds_total{cpu="0",mode="idle"}[1m])*100`
- CPULA 1/5/15;

```
node_load1
node_load5
node_load15
```
- количество свободной оперативной памяти;

`node_memory_MemFree_bytes`
- количество места на файловой системе.

`node_filesystem_avail_bytes{mountpoint="/",fstype!="rootfs"}`

Для решения этого задания приведите promql-запросы для выдачи этих метрик, а также скриншот получившейся Dashboard.

Ответ: Запросы написал выше.

![dashboard](https://github.com/antonmayko/devops-netology/blob/mon-02/mon/mon-02/assets/dashboard.png)

## Задание 3

1. Создайте для каждой Panel подходящее правило alert — можно обратиться к первой лекции в блоке «Мониторинг».
1. В качестве решения задания приведите скриншот вашей итоговой Dashboard.

Ответ:

![alert1](https://github.com/antonmayko/devops-netology/blob/mon-02/mon/mon-02/assets/alert1.png)

![alert2](https://github.com/antonmayko/devops-netology/blob/mon-02/mon/mon-02/assets/alert2.png)

## Задание 4

Сохраните ваш Dashboard. Для этого перейдите в настройки Dashboard, выберите в боковом меню «JSON MODEL». Далее скопируйте отображаемое json-содержимое в отдельный файл и сохраните его.
1. В качестве решения задания приведите листинг этого файла.

Ответ: Листинг файла [json_model](https://github.com/antonmayko/devops-netology/blob/mon-02/mon/mon-02/json_model)

---


