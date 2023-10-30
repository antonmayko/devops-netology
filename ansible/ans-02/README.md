# Домашнее задание к занятию 2 «Работа с Playbook»

## Основная часть

1. Подготовьте свой inventory-файл `prod.yml`.

Ответ:

![prod](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/prod.png)

2. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает [vector](https://vector.dev). Конфигурация vector должна деплоиться через template файл jinja2. От вас не требуется использовать все возможности шаблонизатора, просто вставьте стандартный конфиг в template файл. Информация по шаблонам по [ссылке](https://www.dmosk.ru/instruktions.php?object=ansible-nginx-install).

Ответ: Дописанный плейбук [site.yml](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/playbook/site.yml)

3. При создании tasks рекомендую использовать модули: `get_url`, `template`, `unarchive`, `file`.

Ответ: Рекомендации выполнены.

4. Tasks должны: скачать дистрибутив нужной версии, выполнить распаковку в выбранную директорию, установить vector.

Ответ: Действия выполняются, согласно вышеописанного.

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

Ответ: Ошибок нет, но есть не очень понятное предупреждение. Прошу это прокомментировать.

![lint](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/lint.png)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

Ответ: Не весь плейбук выполнился с этим флагом.

![check](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/check.png)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

Ответ: Плейбук выполнился полностью. Сервисы стартовали.

![play1](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/play-diff1.png)

![c_st](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/clickhouse_status.png)

![v_st](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/vector_status.png)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

Ответ: При повторном запуске ничего не было изменено.

![play2](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/assets/play-diff2.png)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги. Пример качественной документации ansible playbook по [ссылке](https://github.com/opensearch-project/ansible-playbook).

Ответ: [README-PLAY.md](https://github.com/antonmayko/devops-netology/blob/ansible-02/ansible/ans-02/README-PLAY.md) 

---
В git-репозитории, в котором было выполнено задание к занятию «Работа с Playbook», создал новую ветку `ansible-02`, закоммитил 
в эту ветку свой финальный код проекта с тегом `08-ansible-02-playbook`. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `ansible-02`.

Прикрепляю ссылку на свой финальный код, расположенный в ветке ansible-02. 

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/ansible-02/ansible/ans-02/playbook)


