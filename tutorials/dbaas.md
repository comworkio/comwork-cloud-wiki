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

1. Connect with [ssh](./ssh.md), then secure your database:

```shell
$ sudo mysql_secure_installation
Set root password? [Y/n] Y
Remove anonymous users? [Y/n] Y
Disallow root login remotely? [Y/n] Y
Reload privilege tables now? [Y/n] Y
Cleaning up...
```

1. Then create a database and a user that will be able to connect to this database from the outside:

```shell
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
