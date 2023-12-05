# Домашнее задание к занятию 9 «Процессы CI/CD»
------

## Знакомоство с SonarQube

### Основная часть

1. Создайте новый проект, название произвольное.
2. Скачайте пакет sonar-scanner, который вам предлагает скачать SonarQube.
3. Сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
4. Проверьте `sonar-scanner --version`.

Ответ: 
![sonar-version](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/sonar-scanner-version.png)

5. Запустите анализатор против кода из директории [example](./example) с дополнительным ключом `-Dsonar.coverage.exclusions=fail.py`.

Ответ: 
![result](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/running-sonar.png)

6. Посмотрите результат в интерфейсе.

Ответ: 
![result-iface](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/result-sonar.png)

7. Исправьте ошибки, которые он выявил, включая warnings.
8. Запустите анализатор повторно — проверьте, что QG пройдены успешно.

Ответ: 
![result-iface2](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/result-sonar2.png)

9. Сделайте скриншот успешного прохождения анализа, приложите к решению ДЗ.

Ответ: 
![result-iface2](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/result-sonar2.png)

## Знакомство с Nexus

### Основная часть

1. В репозиторий `maven-public` загрузите артефакт с GAV-параметрами:

 *    groupId: netology;
 *    artifactId: java;
 *    version: 8_282;
 *    classifier: distrib;
 *    type: tar.gz.
   
2. В него же загрузите такой же артефакт, но с version: 8_102.

Ответ: 
![maven-public](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/maven-public.png)

3. Проверьте, что все файлы загрузились успешно.
4. В ответе пришлите файл `maven-metadata.xml` для этого артефакта.

```commandline
<?xml version="1.0" encoding="UTF-8"?>
<metadata modelVersion="1.1.0">
  <groupId>netology</groupId>
  <artifactId>java</artifactId>
  <versioning>
    <latest>8_282</latest>
    <release>8_282</release>
    <versions>
      <version>8_102</version>
      <version>8_282</version>
    </versions>
    <lastUpdated>20231204184853</lastUpdated>
  </versioning>
</metadata>
```

### Знакомство с Maven

### Подготовка к выполнению

1. Скачайте дистрибутив с [maven](https://maven.apache.org/download.cgi).
2. Разархивируйте, сделайте так, чтобы binary был доступен через вызов в shell (или поменяйте переменную PATH, или любой другой, удобный вам способ).
3. Удалите из `apache-maven-<version>/conf/settings.xml` упоминание о правиле, отвергающем HTTP- соединение — раздел mirrors —> id: my-repository-http-unblocker.
4. Проверьте `mvn --version`.

Ответ: 
![mvn-version](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/mvn-version.png)

5. Заберите директорию [mvn](./mvn) с pom.

### Основная часть

1. Поменяйте в `pom.xml` блок с зависимостями под ваш артефакт из первого пункта задания для Nexus (java с версией 8_282).
2. Запустите команду `mvn package` в директории с `pom.xml`, ожидайте успешного окончания.
3. Проверьте директорию `~/.m2/repository/`, найдите ваш артефакт.

Ответ: 
![artefact](https://github.com/antonmayko/devops-netology/blob/cicd-03/cicd/cicd-03/assets/artefact.png)

4. В ответе пришлите исправленный файл `pom.xml`.

Ответ: `pom.xml`
```commandline
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
  xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>
 
  <groupId>com.netology.app</groupId>
  <artifactId>simple-app</artifactId>
  <version>1.0-SNAPSHOT</version>
   <repositories>
    <repository>
      <id>my-repo</id>
      <name>maven-public</name>
      <url>http://158.160.112.105:8081/repository/maven-public/</url>
    </repository>
  </repositories>
  <dependencies>
     <dependency>
      <groupId>netology</groupId>
      <artifactId>java</artifactId>
      <version>8_282</version>
      <classifier>distrib</classifier>
      <type>tar.gz</type>
    </dependency> 
  </dependencies>
</project>
```
-----