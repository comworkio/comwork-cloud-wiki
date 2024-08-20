# Migrations des OS

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/os_migrations.md)

## Vérifier la version

```shell
$ cat /etc/os-release
$ cat /etc/redhat-release
```

## CentOS 8 Stream vers Almalinux 8

_Comptez entre 30min et 1h._

Chaque étape dois être jouée avec le user `root`.

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

## AlmaLinux 8 vers AlmaLinux 9

Chaque étape dois être jouée avec le user `root`.

```shell
$ curl https://repo.almalinux.org/elevate/testing/elevate-testing.repo -o /etc/yum.repos.d/elevate-testing.repo
$ rpm --import https://repo.almalinux.org/elevate/RPM-GPG-KEY-ELevate
$ dnf install -y leapp-upgrade leapp-data-almalinux
```

Vérifiez si l'upgrade va bien se passer :

```shell
$ leapp preupgrade
$ cat /var/log/leapp/leapp-report.txt # vérifier ce rapport
```
