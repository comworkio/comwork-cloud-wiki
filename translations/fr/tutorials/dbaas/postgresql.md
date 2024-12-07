# PostgreSQL

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/dbaas/postgresql.md)

## Tutoriel vidéo

[![demo_dbaas](../../../../img/demo_dbaas.png)](https://youtu.be/RWWt9sYTcEM)

Vous pouvez activer les sous-titres en Anglais ou en Français pour avoir les explications.

## Installation

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

3. Se connecter avec [ssh](../ssh.md), ensuite initialiser la base de données et l'utilisateur :

```shell
sudo su -
su - postgres
psql
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' SUPERUSER; # if you want to be a superuser
postgres=> CREATE ROLE your_username LOGIN PASSWORD 'your_password' NOSUPERUSER INHERIT NOCREATEDB NOCREATEROLE NOREPLICATION; # if you want to only be granted on one db
postgres=> CREATE DATABASE "your_db" WITH OWNER = your_username ENCODING = 'UTF8';
```

4. Vous serez en mesure de vous connecter avec l'utilisateur comme ceci :

```shell
psql -U your_username -W your_db
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
