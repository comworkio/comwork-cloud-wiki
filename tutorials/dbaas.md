# Database as a service

## PostgreSQL installation

After provisioning and the first installation:

1. Set to false this variable in the ansible environment file (`env/{ instance_hash }.yml`), the quote are important:

```yaml
pgsql_first_install: "false"
```

2. In the same file, it's highly recommand to allow connection to the port `5432` only from the hosts or networks which need to connect to the db:

```yaml
firewall_allow:
  - port: 22
  - port: 80
  - port: 443
  - port: 5432
    ip: {put your ip or range here}
```

3. Connect with [ssh](./ssh.md), then initialize your database and user:

```shell
$ sudo su -
$ su - postgres
$ psql
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' SUPERUSER; # if you want to be a superuser
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION; # if you want to only be granted on one db
postgres=> CREATE DATABASE "your_db" WITH OWNER = your_username ENCODING = 'UTF8';
```

4. Then you'll be able to connect with this user like that:

```shell
$ psql -U your_username -W your_db
password:
your_db=> CREATE TABLE my_table(my_id INT);
```

If you need to connect from the outside:

```shell
psql -h {your_instance_hash}.pgsql.comwork.(cloud|dev|info) -U your_username -W your_db
```

And here's a JDBC url you can use for your java applications:

```shell
jdbc:postgresql://{your_instance_hash}.pgsql.comwork.(cloud|dev|info):5432/i4db
```
## MariaDB / MySQL installation

1. In the the ansible environment file (`env/{ instance_hash }.yml`), it's highly recommand to allow connection to the port `5432` only from the hosts or networks which need to connect to the db:

```yaml
firewall_allow:
  - port: 22
  - port: 80
  - port: 443
  - port: 3306
    ip: {put your ip or range here}
```

2. Connect with [ssh](./ssh.md), then secure your database:

```shell
$ sudo mysql_secure_installation
Set root password? [Y/n] Y
Remove anonymous users? [Y/n] Y
Disallow root login remotely? [Y/n] Y
Reload privilege tables now? [Y/n] Y
```

3. Then create a database and a user that will be able to connect to this database from the outside:

```shell
$ sudo su -
$ mysql -u -uroot -p # use the password you just set
MariaDB [(none)]> CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
MariaDB [(none)]> CREATE DATABASE your_db;
MariaDB [(none)]> use your_db;
MariaDB [your_db]> GRANT ALL PRIVILEGES ON your_db TO 'your_user'@'%';
MariaDB [your_db]> FLUSH PRIVILEGES;
```

4. Then you'll finally be able to connect with your new user outside:

```shell
mysql -h {your_instance_hash}.mariadb.comwork.(cloud|dev|info) -u your_user -p your_db
```

## Backup on buckets

1. Create your bucket on your favorite cloud provider

Example on scaleway:

![scaleway_bucket](../img/scaleway_bucket.png)

2. Import this opensource [ansible role](https://gitlab.comwork.io/oss/bucket-backup/-/tree/main/ansible-bucket-backup) in the `roles/` folder of your gitlab IaC project (name-it `bucket-backup` instead of `ansible-bucket-backup`)

3. You can change the backup frequency directly in the [`ansible-bucket-backup/tasks/main.yml`](https://gitlab.comwork.io/oss/bucket-backup/-/blob/main/ansible-bucket-backup/tasks/main.yml):


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

By default it's each day at 3.00am.

4. If you're on mysql/mariadb, here's the configuration for a single database:

```yaml
bucket_endpoint: "https://s3.fr-par.scw.cloud" # change-it by your provider
bucket_access_key: changeit
bucket_secret_key: changeit
bucket_name: test-mysql-backup # change-it by your bucket name
backup_cmd: "mysqldump -h {your_instance_hash}.mariadb.comwork.(cloud|dev|info) -u your_user -p'your_password' --databases your_db > /home/backups/backup.sql"
zip_compress_backup_enable: true
backup_zip_file_folder: /home/backups/tmp
backup_src_file_to_clean: '*.sql'
```

If you're on PostgreSQL:

```yaml
bucket_endpoint: "https://s3.fr-par.scw.cloud" # change-it by your provider
bucket_access_key: changeit
bucket_secret_key: changeit
bucket_name: test-pgsql-backup # change-it by your bucket name
backup_cmd: "pg_dumpall -U backup > /home/backup/backup.sql"
zip_compress_backup_enable: true
backup_zip_file_folder: /home/backups/tmp
backup_src_file_to_clean: '*.sql'

postgresql_roles:
  - username: backup
    password: changeit
```

1. Add the role in your `playbook-{instance_name}.yml` file:

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
   - mariadb # this example is for mariadb/mysql, put the backup role after the db installation
   - bucket-backup # here !
   - gw-letsencrypt
   - nginx
   - gitlab-runner
```

6. Add the role in the `.gitlab-ci.yml` file:

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
      - roles/mariadb/**/* # this example is for mariadb/mysql, put the backup role after the db installation
      - roles/bucket-backup/**/* # here !
      - roles/gw-letsencrypt/**/*
      - roles/gw-nginx/**/*
      - roles/gitlab-runner/**/*
      - install.sh
      - playbook-mysql.yml
  tags:
    - mysql-hmcffu
```

Push-it and that's it.

You also run the backup manually this way (on your instance with [ssh](./ssh.md)):

```shell
$ sudo su -
$ /root/bucket-save.sh
```

You'll see the result in your bucket:

![scaleway_backup_result](../img/scaleway_backup_result.png)
