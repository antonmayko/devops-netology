# Домашнее задание к занятию «Безопасность в облачных провайдерах»  

Используя конфигурации, выполненные в рамках предыдущих домашних заданий, нужно добавить возможность шифрования бакета.

---
## Задание 1. Yandex Cloud   

1. С помощью ключа в KMS необходимо зашифровать содержимое бакета:

 - создать ключ в KMS;
 - с помощью ключа зашифровать содержимое бакета, созданного ранее.

Ответ:

Манифест ключа KMS
[kms.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-03/cloudnet/cloudnet-03/src/kms.tf)

Манифест бакета с шифрованием
[storage.tf](https://github.com/antonmayko/devops-netology/blob/cloudnet-03/cloudnet/cloudnet-03/src/storage.tf)

---