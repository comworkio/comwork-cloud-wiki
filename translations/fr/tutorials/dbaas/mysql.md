
# MySQL / MariaDB

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/dbaas/mysql.md)

## Tutoriel vidéo

[![demo_dbaas](../../../../img/demo_dbaas.png)](https://youtu.be/RWWt9sYTcEM)

Vous pouvez activer les sous-titres en Anglais ou en Français pour avoir les explications.

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

2. Se connecter avec [ssh](../ssh.md), et sécuriser le serveur de base de données :

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

## Problèmes

### Too many connections

Cette erreur indique qu'il y a trop de connexions ouvertes sur MySQL/MariaDB.

Pour vérifier le nombre de connexions ouvertes, aller [en ssh](../ssh.md) sur l'instance et exécutez la commande suivante:

```shell
$ netstat -tanpu |grep -i mysql|wc -l
101
```

Généralement il aller regarder dans le code des applications qui utilisent MySQL :
* Si elle utilisent un pool de connexions persistentes pour éviter d'en ouvrir systématiquement à chaque requêtes
* Si des requêtes prennent trop de temps, provoquant ainsi la multiplication d'ouverture de connexions

Exemple pour PHP PDO : https://www.php.net/manual/fr/pdo.connections.php

```php
<?php
$dbh = new PDO('mysql:host=localhost;dbname=test', $user, $pass, array(
    PDO::ATTR_PERSISTENT => true
));
?>
```
