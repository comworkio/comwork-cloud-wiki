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

Vérifiez si la mise à jour va bien se passer :

```shell
$ leapp preupgrade
$ cat /var/log/leapp/leapp-report.txt # vérifier ce rapport
```

Si vous trouvez un problème marqué comme `high (inhibitor)`, par exemple :

```
Risk Factor: high (inhibitor)
Title: Upgrade requires links in root directory to be relative
Summary: After rebooting, parts of the upgrade process can fail if symbolic links in / point to absolute paths.
Please change these links to relative ones.
Remediation: [command] sh -c ln -snf var/lib/snapd/snap /snap
Key: XXXXX
```

Vous devez le corriger, en reprenant l'exemple, voici la correction :

```shell
cd /
ln -snf var/lib/snapd/snap /snap
```

Puis, lancer la mise à jour :

```shell
$ leapp upgrade
```
