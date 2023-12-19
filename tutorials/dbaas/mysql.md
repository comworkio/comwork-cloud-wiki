# MySQL / MariaDB

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/dbaas/mysql.md)

## Video tutorial

[![demo_dbaas](../../img/demo_dbaas.png)](https://youtu.be/RWWt9sYTcEM)

You can activate the subtitles in English or French to get more details on this demo. 

## Installation

1. In the the ansible environment file (`env/{ instance_hash }.yml`), it's highly recommand to allow connection to the port `3306` only from the hosts or networks which need to connect to the db:

```yaml
firewall_allow:
  - port: 22
  - port: 80
  - port: 443
  - port: 3306
    ip: {put your ip or range here}
```

2. Connect with [ssh](../ssh.md), then secure your database:

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
$ mysql -uroot -p # use the password you just set
MariaDB [(none)]> CREATE USER 'your_user'@'%' IDENTIFIED BY 'your_password';
MariaDB [(none)]> CREATE DATABASE your_db;
MariaDB [(none)]> use your_db;
MariaDB [your_db]> GRANT ALL PRIVILEGES ON your_db TO 'your_user'@'%';
MariaDB [your_db]> GRANT ALL PRIVILEGES ON your_db.* TO 'your_user'@'%';
MariaDB [your_db]> FLUSH PRIVILEGES;
```

4. Then you'll finally be able to connect with your new user outside:

```shell
mysql -h {your_instance_hash}.mariadb.comwork.(cloud|dev|info) -u your_user -p your_db
```

Then you can try some SQL commands:

```shell
mysql> CREATE TABLE my_table (id INTEGER);
Query OK, 0 rows affected (0.04 sec)
mysql> INSERT INTO my_table VALUES (1);
Query OK, 1 row affected (0.04 sec)
```

## Troubleshootings

### Too many connections

This errors indicates that there is too many opened connection to the MySQL/MariaDB server.

In order to get the number of opened connections, connect [with ssh](../ssh.md) on the instance and run the following command:

```shell
$ netstat -tanpu |grep -i mysql|wc -l
101
```

We often have to investigate the code of the applications that are using the MySQL/MariaDB cluster to check:
* If they are using a pool of persistent connections in order to avoid opening too much new connections without closing it
* If some query are taking too much time and blocking the existing connections

Example for PHP PDO: https://www.php.net/manual/fr/pdo.connections.php

```php
<?php
$dbh = new PDO('mysql:host=localhost;dbname=test', $user, $pass, array(
    PDO::ATTR_PERSISTENT => true
));
?>
```
