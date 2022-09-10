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
