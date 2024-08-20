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
