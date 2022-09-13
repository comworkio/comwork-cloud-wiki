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

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user.  If you've just installed MariaDB, and
you haven't set the root password yet, the password will be blank,
so you should just press enter here.

Enter current password for root (enter for none): 
OK, successfully used password, moving on...

Setting the root password ensures that nobody can log into the MariaDB
root user without the proper authorisation.

Set root password? [Y/n] Y
New password: 
Re-enter new password: 
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] Y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] Y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] Y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] Y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
```

3. Then you can connect from the outside:

```shell
mysql -h {your_instance_hash}.pgsql.comwork.(cloud|dev|info) -uroot -p
