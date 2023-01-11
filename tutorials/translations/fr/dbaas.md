# Database as a service

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../dbaas.md)

## Tutoriel vidéo

[![demo_dbaas](../../../img/demo_dbaas.png)](https://youtu.be/RWWt9sYTcEM)

Vous pouvez activer les sous-titres en Anglais ou en Français pour avoir les explications.

## Installation de PostgreSQL

Après le provisionnement de l'instance et la première installation :

1. Mettre à `false` cette variable dans le fichier d'environnement ansible (`env/{ instance_hash }.yml`), les guillements sont importants :

```yaml
pgsql_first_install: "false"
```

2. Dans le même fichier, il est hautement recommandé de n'ouvrir le port `5432` qu'aux machines ou réseaux qui ont besoin d'accéder à cette base :

```yaml
firewall_allow:
  - port: 22
  - port: 80
  - port: 443
  - port: 5432
    ip: {put your ip or range here}
```

3. Se connecter avec [ssh](./ssh.md), ensuite initialiser la base de données et l'utilisateur :

```shell
$ sudo su -
$ su - postgres
$ psql
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' SUPERUSER; # if you want to be a superuser
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION; # if you want to only be granted on one db
postgres=> CREATE DATABASE "your_db" WITH OWNER = your_username ENCODING = 'UTF8';
```

4. Vous serez en mesure de vous connecter avec l'utilisateur comme ceci :

```shell
$ psql -U your_username -W your_db
password:
your_db=> CREATE TABLE my_table(my_id INT);
your_db=> INSERT INTO my_table VALUES (1);
```

Si vous voulez vous connecter depuis l'extérieur :

```shell
psql -h {your_instance_hash}.pgsql.comwork.(cloud|dev|info) -U your_username -W your_db
```

Voici l'URL JDBC que vous pourrez mettre dans vos applications Java :

```shell
jdbc:postgresql://{your_instance_hash}.pgsql.comwork.(cloud|dev|info):5432/i4db
```
## Installation MariaDB / MySQL

1. Dans le fichier d'environnement ansible (`env/{ instance_hash }.yml`), il est hautement recommandé de n'ouvrir le port `3306` qu'aux machines ou réseaux qui ont besoin d'accéder à cette base :

```yaml
firewall_allow:
  - port: 22
  - port: 80
  - port: 443
  - port: 3306
    ip: {put your ip or range here}
```

2. Se connecter avec [ssh](./ssh.md), et sécuriser le serveur de base de données :

```shell
$ sudo mysql_secure_installation
Set root password? [Y/n] Y
Remove anonymous users? [Y/n] Y
Disallow root login remotely? [Y/n] Y
Reload privilege tables now? [Y/n] Y
```

3. Ensuite créer une base de données et son utilisateur que l'on pourra ré-utiliser pour se connecter depuis l'extérieur :

```shell
$ sudo su -
$ mysql -uroot -p # use the password you just set
MariaDB [(none)]> CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
MariaDB [(none)]> CREATE DATABASE your_db;
MariaDB [(none)]> use your_db;
MariaDB [your_db]> GRANT ALL PRIVILEGES ON your_db TO 'your_user'@'%';
MariaDB [your_db]> GRANT ALL PRIVILEGES ON your_db.* TO 'your_user'@'%';
MariaDB [your_db]> FLUSH PRIVILEGES;
```

1. Vous serez finalement en mesure de vous connecter depuis l'extérieur comme ceci :

```shell
mysql -h {your_instance_hash}.mariadb.comwork.(cloud|dev|info) -u your_user -p your_db
```

Vous pouvez ensuite tester ces commandes SQL :

```shell
mysql> CREATE TABLE my_table (id INTEGER);
Query OK, 0 rows affected (0.04 sec)
mysql> INSERT INTO my_table VALUES (1);
Query OK, 1 row affected (0.04 sec)
```

## Sauvegardes sur object storage

Ce chapitre vous montrera comment sauvegarder vos bases de données sur de l'object storage en ré-utilisant le role ansible [`backup-bucket`](https://gitlab.comwork.io/oss/bucket-backup) qu'on l'ont fournit en opensource pour cet usage.

1. Créer un bucket sur votre cloud provider favoris

Par exemple sur scaleway :

![scaleway_bucket](../../../img/scaleway_bucket.png)

Vous pouvez demander à l'équipe de comwork cloud l'accès à des buckets en suivant [cette procédure](../../../storage.md)

2. Importez ce [role ansible](https://gitlab.comwork.io/oss/bucket-backup/-/tree/main/ansible-bucket-backup) dans le dossier `roles/` de votre projet gitlab IaC[^1] (nommez-le `bucket-backup` au lieu de `ansible-bucket-backup`)

3. Vous pouvez changer la fréquence de sauvegarde directement dans le fichier [`ansible-bucket-backup/tasks/main.yml`](https://gitlab.comwork.io/oss/bucket-backup/-/blob/main/ansible-bucket-backup/tasks/main.yml) :


```yaml
- name: Creates backup cron
  ansible.builtin.cron:
    name: backup cron
    minute: "0"
    hour: "3"
    user: root
    job: "bash {{ node_home }}/bucket-save.sh"
    cron_file: ansible_bucket_backup
```

Par défaut ce sera tous les jours à 3h00 du matin.

4. Si vous êtes sur MySQL/MariaDB, voici la configuration pour une base de données :

```yaml
backup_date_format: "+%Y%m%d"
bucket_endpoint: "https://s3.fr-par.scw.cloud" # changez pour votre provider
bucket_access_key: changeit
bucket_secret_key: changeit
bucket_name: test-mysql-backup # changez le nom du bucket
backup_folder: /home/backups
backup_inside_container: /db-data
backup_cmd: "mysqldump -h {your_instance_hash}.mariadb.comwork.(cloud|dev|info) -u your_user -p'your_password' --databases your_db > /home/backups/backup.sql"
zip_compress_backup_enable: true
backup_zip_file_folder: /home/backups/tmp
backup_src_file_to_clean: '*.sql'
backup_max_retention: 3 # nombre de jour de rétention que vous pouvez ajuster
```

Si vous êtes sur PostgreSQL :

```yaml
backup_date_format: "+%Y%m%d"
bucket_endpoint: "https://s3.fr-par.scw.cloud" # changez pour votre provider
bucket_access_key: changeit
bucket_secret_key: changeit
bucket_name: test-pgsql-backup # changez le nom du bucket
backup_folder: /home/backups
backup_inside_container: /db-data
backup_cmd: "pg_dumpall -U backup > /home/backups/backup.sql"
zip_compress_backup_enable: true
backup_zip_file_folder: /home/backups/tmp
backup_src_file_to_clean: '*.sql'
backup_max_retention: 3 # nombre de jour de rétention que vous pouvez ajuster

postgresql_roles:
  - username: backup
    password: changeit
```

1. Ajoutez le role dans le fichier `playbook-{instance_name}.yml` :

```yaml
- hosts: localhost
  roles:
   - common
   - fail2ban
   - sudo
   - ssh
   - cloud-instance-ssh-keys
   - firewall
   - kinsing
   - docker
   - imalive
   - mariadb # cet exemple est pour MySQL/MariaDB, mettez le rôle de la sauvegarde après l'installation du serveur de bdd
   - bucket-backup # ici !
   - gw-letsencrypt
   - nginx
   - gitlab-runner
```

1. Ajoutez les rôle dans le fichier `.gitlab-ci.yml` :

```yaml
mysql:
  stage: deploy
  script:
    - chmod +x ./install.sh
    - ./install.sh -e mysql
  only:
    refs:
      - /^(main.*)$/
    changes:
      - env/mysql.yml
      - roles/common/**/*
      - roles/ssh/**/*
      - roles/cloud-instance-ssh-keys/**/*
      - roles/fail2ban/**/*
      - roles/sudo/**/*
      - roles/firewall/**/*
      - roles/kinsing/**/*
      - roles/docker/**/*
      - roles/imalive/**/*
      - roles/mariadb/**/* # cet exemple est pour MySQL/MariaDB, mettez le rôle de la sauvegarde après l'installation du serveur de bdd
      - roles/bucket-backup/**/* # ici !
      - roles/gw-letsencrypt/**/*
      - roles/gw-nginx/**/*
      - roles/gitlab-runner/**/*
      - install.sh
      - playbook-mysql.yml
  tags:
    - mysql-hmcffu
```

Pushez et puis c'est finit.

Vous pouvez aussi exécuter la sauvegarde comme ceci (en vous connectant avec [ssh](./ssh.md)):

```shell
$ sudo su -
$ /root/bucket-save.sh
```

Vous verrez le résultat sur votre bucket :

![scaleway_backup_result](../../../img/scaleway_backup_result.png)

[^1]: infrastructure as code
