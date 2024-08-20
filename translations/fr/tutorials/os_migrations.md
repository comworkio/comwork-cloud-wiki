# Migrations des OS

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/os_migrations.md)

## Vérifier la version

```shell
$ cat /etc/os-release
```

## CentOS 8 Stream vers Almalinux 8

```shell
$ curl -O https://raw.githubusercontent.com/AlmaLinux/almalinux-deploy/master/almalinux-deploy.sh
$ sudo bash almalinux-deploy.sh
```

Une fois terminé, vous devriez avoir ce message :

```shell
The new EFI boot record for AlmaLinux is added                        OK

Migration to AlmaLinux is completed
```

Ensuite redémarrez :

```shell
$ reboot
```

Ensuite vérifier le résultat et mettre à jour :

```shell
$ cat /etc/redhat-release
AlmaLinux release 8.10 (Cerulean Leopard)
$ dnf update -y
$ dnf upgrade -y
```
