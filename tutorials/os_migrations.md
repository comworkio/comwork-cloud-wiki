# OS migrations

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/os_migrations.md)

## Check the OS release

```shell
$ cat /etc/os-release
$ cat /etc/redhat-release
```

## CentOS 8 Stream to Almalinux 8

_Between 30 min and 1 hour._

Every step has to be run with the `root` user.

```shell
$ curl -O https://raw.githubusercontent.com/AlmaLinux/almalinux-deploy/master/almalinux-deploy.sh
$ sudo bash almalinux-deploy.sh
```

Once it's finished you should have this message:

```shell
The new EFI boot record for AlmaLinux is added                        OK

Migration to AlmaLinux is completed
```

Then reboot:

```shell
$ reboot
```

Then check the result:

```shell
$ cat /etc/redhat-release
AlmaLinux release 8.10 (Cerulean Leopard)
$ dnf update -y
$ dnf upgrade -y
```

## AlmaLinux 8 to AlmaLinux 9

Every step has to be run with the `root` user.

```shell
$ curl https://repo.almalinux.org/elevate/testing/elevate-testing.repo -o /etc/yum.repos.d/elevate-testing.repo
$ rpm --import https://repo.almalinux.org/elevate/RPM-GPG-KEY-ELevate
$ dnf install -y leapp-upgrade leapp-data-almalinux
```

Run a `preupgrade` which will check if everything will be ok:

```shell
$ leapp preupgrade
$ cat /var/log/leapp/leapp-report.txt # check the report
```

