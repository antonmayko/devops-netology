# devops-netology
# second line comment
Будут игнорироваться в каталоге terraform:
- каталоги .terraform в любом месте вложенности
- Файлы состояний, оканчивающиеся на .tfstate
 и имеющие в середине имени  .tfstate.
- логи
crash.log
crash.*.log

- файлы с расширением tfvars и tfvars.json

- еще файлы:
override.tf
override.tf.json
*_override.tf
*_override.tf.json

- и еще какие-то конфигурационные файлы .terraformrc и terraform.rc

Всё это добро игнорится в любом месте вложенности

новая строчка 25.08.2023
