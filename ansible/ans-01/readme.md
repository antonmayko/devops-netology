# Домашнее задание к занятию 1 «Введение в Ansible»

1. Попробуйте запустить playbook на окружении из `test.yml`, зафиксируйте значение, которое имеет факт `some_fact` для указанного хоста при выполнении playbook.

Ответ:

![some-fact](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/fact1.png)

2. Найдите файл с переменными (group_vars), в котором задаётся найденное в первом пункте значение, и поменяйте его на `all default fact`.

Ответ: поменял - `some_fact: all default fact` в файле `all/examp.yml`

3. Воспользуйтесь подготовленным (используется `docker`) или создайте собственное окружение для проведения дальнейших испытаний.

Ответ: создал два контейнера с именами `centos7` и `ubuntu`

4. Проведите запуск playbook на окружении из `prod.yml`. Зафиксируйте полученные значения `some_fact` для каждого из `managed host`.

Ответ: 

![docker-fact](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/docker-facts.png)

5. Добавьте факты в `group_vars` каждой из групп хостов так, чтобы для `some_fact` получились значения: для `deb` — `deb default fact`, для `el` — `el default fact`.

Ответ: Добавил.

6.  Повторите запуск playbook на окружении `prod.yml`. Убедитесь, что выдаются корректные значения для всех хостов.

Ответ:

![docker-fact2](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/docker-facts2.png)

7. При помощи `ansible-vault` зашифруйте факты в `group_vars/deb` и `group_vars/el` с паролем `netology`.

Ответ: Зашифровал.

![enc1](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/encrypt1.png)

8. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь в работоспособности.

Ответ: Запустил, ввел пароль и убедился в работоспособности.

![play-with-pass](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/play-with-pass.png)

9. Посмотрите при помощи `ansible-doc` список плагинов для подключения. Выберите подходящий для работы на `control node`.

Ответ: Выбрал встроенный плагин `local`

10. В `prod.yml` добавьте новую группу хостов с именем  `local`, в ней разместите localhost с необходимым типом подключения.

Ответ: Добавил. 

11. Запустите playbook на окружении `prod.yml`. При запуске `ansible` должен запросить у вас пароль. Убедитесь, что факты `some_fact` для каждого из хостов определены из верных `group_vars`.

Ответ:

![with-local](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/with-local.png)

---
## Необязательная часть

1. При помощи `ansible-vault` расшифруйте все зашифрованные файлы с переменными.

Ответ: 

![decript](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/decrypt1.png)

2. Зашифруйте отдельное значение `PaSSw0rd` для переменной `some_fact` паролем `netology`. Добавьте полученное значение в `group_vars/all/exmp.yml`.

Ответ: Зашифровал и добавил в `group_vars/all/exmp.yml`

![enc-pass](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/enc-pass.png)

3. Запустите `playbook`, убедитесь, что для нужных хостов применился новый `fact`.

Ответ:

![new-fact](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/new-fact.png)

4. Добавьте новую группу хостов `fedora`, самостоятельно придумайте для неё переменную. В качестве образа можно использовать [этот вариант](https://hub.docker.com/r/pycontribs/fedora).

Ответ:

![fedora](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/assets/fedora.png)

5. Напишите скрипт на bash: автоматизируйте поднятие необходимых контейнеров, запуск ansible-playbook и остановку контейнеров.

Ответ: Скрипт [start.sh](https://github.com/antonmayko/devops-netology/blob/ansible-01/ansible/ans-01/start.sh)

---

В git-репозитории, в котором было выполнено задание к занятию «Введение в Ansible», создал новую ветку `ansible-01`, закоммитил 
в эту ветку свой финальный код проекта. Ответы на задания и необходимые скриншоты оформил в md-файле в ветке `ansible-01`.

Прикрепляю ссылку на свой финальный код, расположенный в ветке ansible-01. 

[Финальный код проекта](https://github.com/antonmayko/devops-netology/tree/ansible-01/ansible/ans-01/playbook)