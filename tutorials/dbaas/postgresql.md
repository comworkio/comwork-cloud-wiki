# PostgreSQL

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/dbaas/postgresql.md)

## Video tutorial

[![demo_dbaas](../../img/demo_dbaas.png)](https://youtu.be/RWWt9sYTcEM)

You can activate the subtitles in English or French to get more details on this demo. 

## Installation

After provisioning and the first installation:

1. Set to `false` this variable in the ansible environment file (`env/{ instance_hash }.yml`), the quote are important:

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

3. Connect with [ssh](../ssh.md), then initialize your database and user:

```shell
sudo su -
su - postgres
psql
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' SUPERUSER; # if you want to be a superuser
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION; # if you want to only be granted on one db
postgres=> CREATE DATABASE "your_db" WITH OWNER = your_username ENCODING = 'UTF8';
```

4. Then you'll be able to connect with this user like that:

```shell
psql -U your_username -W your_db
password:
your_db=> CREATE TABLE my_table(my_id INT);
your_db=> INSERT INTO my_table VALUES (1);
```

If you need to connect from the outside:

```shell
psql -h {your_instance_hash}.pgsql.comwork.(cloud|dev|info) -U your_username -W your_db
```

And here's a JDBC url you can use for your java applications:

```shell
jdbc:postgresql://{your_instance_hash}.pgsql.comwork.(cloud|dev|info):5432/i4db
```
