#!/bin/bash

# Запускаем контейнеры
docker start centos7 fedora ubuntu

cd /mnt/data/soft/netology/devops-netology/ansible/ans-01

# Запускаем плейбук
ansible-playbook --ask-vault-pass -i playbook/inventory/prod.yml playbook/site.yml

# Останавливаем контейнеры
docker stop centos7 fedora ubuntu