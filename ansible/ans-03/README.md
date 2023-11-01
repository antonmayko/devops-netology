# Домашнее задание к занятию 3 «Использование Ansible»

## Основная часть

1. Допишите playbook: нужно сделать ещё один play, который устанавливает и настраивает LightHouse.

Ответ: [site.yml](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/playbook/site.yml)

2. При создании tasks рекомендую использовать модули: `get_url`, `template`, `yum`, `apt`.

Ответ: Рекомендации выполнены.

3. Tasks должны: скачать статику LightHouse, установить Nginx или любой другой веб-сервер, настроить его конфиг для открытия LightHouse, запустить веб-сервер.

Ответ: Выбрал вебсервер Апач для установки. Действия выполняются, согласно вышеописанного

4. Подготовьте свой inventory-файл `prod.yml`.

Ответ: [prod.yml](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/playbook/inventory/prod.yml) 

5. Запустите `ansible-lint site.yml` и исправьте ошибки, если они есть.

Ответ: ![lint](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/assets/lint.png)

6. Попробуйте запустить playbook на этом окружении с флагом `--check`.

Ответ: Не весь плейбук выполнился с этим флагом.

![check](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/assets/check.png)

7. Запустите playbook на `prod.yml` окружении с флагом `--diff`. Убедитесь, что изменения на системе произведены.

Ответ: 

![diff1](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/assets/diff1.png)

8. Повторно запустите playbook с флагом `--diff` и убедитесь, что playbook идемпотентен.

Ответ: Повторно ничего не выполняется, кроме копирования папки lighthouse, хотя ее содержимое не меняется вроде.
Возможно git clone что-то всё-таки обновляет. 
```
    - name: Copy dir to /var/www
      become: true
      ansible.builtin.copy:
        src: lighthouse
        dest: /var/www/
        mode: 0755
        remote_src: yes

```
![diff2](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/assets/diff2.png)

9. Подготовьте README.md-файл по своему playbook. В нём должно быть описано: что делает playbook, какие у него есть параметры и теги.

Ответ: [README-PLAY.md](https://github.com/antonmayko/devops-netology/blob/ansible-03/ansible/ans-03/README-PLAY.md) 


---
В git-репозитории, в котором было выполнено задание к занятию «Использование Ansible», создал новую ветку `ansible-03`, закоммитил 
в эту ветку свой финальный код проекта с тегом `08-ansible-03-yandex`. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `ansible-03`.

Прикрепляю ссылку на свой финальный код, расположенный в ветке ansible-03. 

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/ansible-03/ansible/ans-03/playbook)


