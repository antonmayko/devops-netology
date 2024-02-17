

## Ансибл плейбук проекта "Сборщик логов"

Этот публичный репозиторий содержит Ansible Playbook для установки связки ClickHouse+Vector+Lighthouse.
Каждый компонент устанавливается на отдельный хост.
ClickHouse используется для хранения логов.
Vector собирает логи из различных источников и складывает их в БД clickhouse.
Lighthouse является веб интерфейсом для просмотра логов, хранящихся в базе данных. 

## Версия и ветки
На данный момент код проекта находится в единственной ветке `ansible-03`

## Установка Сборщика логов

Этот ансибл плейбук поддерживает следующее:

- Может быть развёрнут на физических серверах или виртуальных машинах.
- Поддерживает дистрибутив Linux Centos7.

### Требования для установки

- **Ansible 2.10+**
- **Linux Centos 7**

### Настройка

Обратитесь к файлу `playbook/inventory/prod.yml` для изменения IP адресов хостов, 
куда будет производиться установка и настройка ПО.

### Установка

Запуск плейбука выполняется командой:

    ansible-playbook -i playbook/inventory/prod.yml playbook/site.yml

## Помощь

Если вы обнаружили ошибку или у вас есть запрос на добавление функции, не стесняйтесь открывать проблему в этом репозитории. 

## Безопасность

Если вы обнаружите потенциальную проблему безопасности в этом проекте, 
мы просим вас уведомить нас по электронной почте support@somemail.ru.
Пожалуйста, не создавайте публичную задачу на GitHub. 

## Лицензия

Этот проект распространяется по лицензии  [Apache v2.0 License](LICENSE.txt).

## Авторские права

Авторские права принадлежат участникам сообщества "Рога и копыта")