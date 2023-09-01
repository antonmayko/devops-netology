# Домашнее задание по лекции "Инструменты Git"


## Найдите полный хеш и комментарий коммита, хеш которого начинается на `aefea`
 
Получаем командой: 

`git show aefea`

Результат: 

```
commit aefead2207ef7e2aa5dc81a34aedf0cad4c32545
Update CHANGELOG.md
```

## Какому тегу соответствует коммит `85024d3`

Получаем командой: 
 
`git show 85024d3`

Результат: 

```
commit 85024d3100126de36331c6982bfaac02cdab9e76 (tag: v0.12.23)
```

## Сколько родителей у коммита `b8d720`? Напишите их хеши.

У коммита  `b8d720` два родителя `56cd7859e0`  и `9ea88f22fc` , т.к. это мерж коммит.

Команда:

`git log b8d720`

нам это незамедлительно показывает:
```
commit b8d720f8340221f2146e4e4870bf2ee0bc48f2d5

Merge: 56cd7859e0 9ea88f22fc

Author: Chris Griggs <cgriggs@hashicorp.com>
Date:   Tue Jan 21 17:45:48 2020 -0800
```

## Перечислите хеши и комментарии всех коммитов, которые были сделаны между тегами `v0.12.23` и `v0.12.24`

Командой:

`git show v0.12.24`

узнаём хеш коммита, соответствующего этому тегу.

```
commit 33ff1c03bb960b332be3af2e333462dde88b279e (tag: v0.12.24)
```

Затем командой:

`git log 33ff1c03bb960b332be3af2e333462dde88b279e --oneline`

смотрим историю и видим, что между тегами `v0.12.23` и `v0.12.24` сидят следующие коммиты:

```
b14b74c493 [Website] vmc provider links
3f235065b9 Update CHANGELOG.md
6ae64e247b registry: Fix panic when server is unreachable
5c619ca1ba website: Remove links to the getting started guide's old location
06275647e2 Update CHANGELOG.md
d5f9411f51 command: Fix bug when using terraform login on Windows
4b6d06cc5d Update CHANGELOG.md
dd01a35078 Update CHANGELOG.md
225466bc3e Cleanup after v0.12.23 release
```

## Найдите коммит, в котором была создана функция `func providerSource`, её определение в коде выглядит так: `func providerSource(...)` (вместо троеточия перечислены аргументы).

Ищем упоминания этой функции командой:

`git log -S 'func providerSource' --oneline`

Результат:
```
5af1e6234a main: Honor explicit provider_installation CLI config when present
8c928e8358 main: Consult local directories as potential mirrors of providers
```
Смотрим первый созданный коммит с помощью команды:

`git show 8c928e8358`

и находим, что в файле `provider_source.go` была добавлена эта функция.

Итого: полный хеш коммита `8c928e83589d90a031f811fae52a81be7153e82f`


## Найдите все коммиты, в которых была изменена функция `globalPluginDirs`.

Командой:

`git grep -n 'globalPluginDirs'`

находим файл, в котором упоминается эта функция:
```
plugins.go:15:// globalPluginDirs returns directories that should be searched for
plugins.go:21:func globalPluginDirs() []string {
```
затем командой:

`git log -L :globalPluginDirs:plugins.go`

находим коммиты, в которых эта функция была изменена:
```
78b1220558 Remove config.go and update things using its aliases
52dbf94834 keep .terraform.d/plugins for discovery
41ab0aef7a Add missing OS_ARCH dir to global plugin paths
66ebff90cd move some more plugin search path logic to command
8364383c35 Push plugin discovery down into command package
```

## Кто автор функции synchronizedWriters?

Командой:

`git log -S 'synchronizedWriters' --oneline`

ищем упоминания этой функции.

Она впервые упоминается в коммите `5ac311e2a9`

Затем командой:

`git show 5ac311e2a9`

находим автора коммита.
```
Author: Martin Atkins <mart@degeneration.co.uk>
```
Получается, он и есть автор функции.
