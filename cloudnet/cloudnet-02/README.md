# Домашнее задание к занятию «Вычислительные мощности. Балансировщики нагрузки»  

---
## Задание 1. Yandex Cloud 

**Что нужно сделать**

1. Создать бакет Object Storage и разместить в нём файл с картинкой:

 - Создать бакет в Object Storage с произвольным именем (например, _имя_студента_дата_).
 - Положить в бакет файл с картинкой.
 - Сделать файл доступным из интернета.

Ответ:

Манифест для бакета Object Storage
[storage.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/src/storage.tf)

Бакет, который содержит файл с картинкой:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/bucket1.png)

Картинка доступна из интернета:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/file-pub.png)

 
2. Создать группу ВМ в public подсети фиксированного размера с шаблоном LAMP и веб-страницей, содержащей ссылку на картинку из бакета:

 - Создать Instance Group с тремя ВМ и шаблоном LAMP. Для LAMP рекомендуется использовать `image_id = fd827b91d99psvq5fjit`.
 - Для создания стартовой веб-страницы рекомендуется использовать раздел `user_data` в [meta_data](https://cloud.yandex.ru/docs/compute/concepts/vm-metadata).
 - Разместить в стартовой веб-странице шаблонной ВМ ссылку на картинку из бакета.
 - Настроить проверку состояния ВМ.

Ответ:
- манифест для группы ВМ
[vmgroup-public.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/src/vmgroup-public.tf)
- манифест для создания стартовой страницы, которая содержит ссылку на картинку из бакета
[cloud-init.yml](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/src/cloud-init.yml)

Созданные три ВМ:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/vms.png)

 
3. Подключить группу к сетевому балансировщику:

 - Создать сетевой балансировщик.
 - Проверить работоспособность, удалив одну или несколько ВМ.

Ответ:

Манифест сетевого балансировщика
[balancer.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/src/balancer.tf)

Отображение страницы index.html через IP адрес созданного балансировщика:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/index.png)

Исходный код страницы `index.html`:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/source.png)

Исходный код страницы `index.html`:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/source.png)

Удаление двух ВМ:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/del-vm.png)

Осталась в работе только одна ВМ:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/1vm.png)

Балансировщик снова создает две ВМ:

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/prov.png)

На всех этапах ручного удаления ВМ и пересоздания ВМ балансировщиком, сохраняется доступ к странице `index.html`

![cloudnet](https://github.com/antonmayko/devops-netology/blob/cloudnet-02/cloudnet/cloudnet-02/assets/index2.png)

---

