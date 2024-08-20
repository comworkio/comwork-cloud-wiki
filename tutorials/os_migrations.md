# OS migrations

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/os_migrations.md)

## Check the OS release

```shell
$ cat /etc/os-release
```

## CentOS 8 Stream to Almalinux 8

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
