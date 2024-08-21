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

_Comptez entre 1h et 3h._

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

Si vous trouvez un problème marqué comme `high (inhibitor)`, il faut les corriger.

Une fois corrigés, vous pouvez relancer la commande suivante :

```shell
$ leapp upgrade
```

Ensuite vous aurez un résultat comme ceci :

```shell
============================================================
                      REPORT OVERVIEW
============================================================

HIGH and MEDIUM severity reports:
    1. Leapp detected loaded kernel drivers which are no longer maintained in RHEL 9.
    2. Packages not signed by Red Hat found on the system

Reports summary:
    Errors:                      0
    Inhibitors:                  0
    HIGH severity reports:       2
    MEDIUM severity reports:     0
    LOW severity reports:        3
    INFO severity reports:       2

Before continuing consult the full report:
    A report has been generated at /var/log/leapp/leapp-report.json
    A report has been generated at /var/log/leapp/leapp-report.txt

============================================================
                   END OF REPORT OVERVIEW
============================================================
```

Ouvrez une console web/kvm de votre machine virtuelle pour avoir accès graphiquement au grub au rédémarrage puis lancer cette commande :

```shell
$ reboot
```

Puis __rapidement__ sélectionner l'entrée `ELevate-Upgrade-Initramfs` dans les choix de boot:

![grub_upgrade_almalinux](../../../img/grub_upgrade_almalinux.png)

Laissez ensuite l'upgrade se poursuivre sur la console web/kvm.

Ensuite vérifier le résultat et mettre à jour :

```shell
$ cat /etc/redhat-release
AlmaLinux release 9.3 (Shamrock Pampas Cat)
$ dnf update -y
$ dnf upgrade -y
```

Lancez ensuite ces commandes pour corriger le pipeline ansible :

```shell
$ pip install hvac
$ dnf install snapd -y
```

[^1]: une fois que toutes les instances sont à jour, vous devriez mettre à jour le role `common` pour automatiser cela.

Et enfin dans la configuration ansible, mettez à jour les variables suivantes comme ceci et relancer un pipeline :

```shell
centos_version: 9
docker_legacy_repo_install: false
docker_repo_install: true
```

Vous devrez aussi potentiellement remplacer la commande `docker-compose` par `docker compose` dans certains roles ansible et également supprimer tous les conteneurs pour les recréer:

```shell
$ docker ps -a|awk '{system ("docker rm -f "$1)}'
```

## Les erreurs leapp

### Liens symboliques qui pointent vers des chemins absolus

Exemple de message d'erreur :

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

### Détection d'un custom network-scripts

Exemple de message d'erreur :

```
Risk Factor: high (inhibitor)
Title: custom network-scripts detected
Summary: RHEL 9 does not support the legacy network-scripts package that was deprecated in RHEL 8. Custom network-scripts have been detected.
Remediation: [hint] Migrate the custom network-scripts to NetworkManager dispatcher scripts manually before the upgrade. Follow instructions in the official documentation.
Key: XXXXX
```

En reprenant l'exemple, voici la correction :   

```shell
$ mkdir /opt/network-scripts/
$ mv /sbin/if*-local /opt/network-scripts/
```

Créer le fichier `/etc/NetworkManager/dispatcher.d/20-if-local` avec ce contenu :

```bash
#!/bin/bash

test -n "$DEVICE_IFACE" || exit 0

run() {
    test -x "$1" || exit 0
    "$1" "$DEVICE_IFACE"
}                

case "$2" in 
    "up")   
        run /opt/network-scripts/ifup-local
        ;;      
    "pre-up")
        run /opt/network-scripts/ifup-pre-local
        ;;      
    "down") 
        run /opt/network-scripts/ifdown-local
        ;;      
    "pre-down")
        run /opt/network-scripts/ifdown-pre-local
        ;;      
esac
```

Définissez les autorisations sur le script /etc/NetworkManager/dispatcher.d/20-if-local :  

```shell
$ chown root:root /etc/NetworkManager/dispatcher.d/20-if-local
$ chmod +x /etc/NetworkManager/dispatcher.d/20-if-local
$ restorecon /etc/NetworkManager/dispatcher.d/20-if-local
```

Si vous avez besoin d'événements pre-up ou pre-down, créez un lien symbolique dans le répertoire du répartiteur correspondant :

```shell
ln -s ../20-if-local /etc/NetworkManager/dispatcher.d/pre-up.d/
ln -s ../20-if-local /etc/NetworkManager/dispatcher.d/pre-down.d/
```

Toutes ces instructions se trouvent dans la [documentation officielle de Redhat](https://access.redhat.com/solutions/6900331)

### Pas assez d'espace disque

Exemple de message d'erreur :

```
2024-08-20 09:38:32.570 ERROR    PID: 43069 leapp.workflow.Download.dnf_package_download: Cannot calculate, check, test, or perform the upgrade transaction.

============================================================
                           ERRORS
============================================================

2024-08-20 09:38:33.171673 [ERROR] Actor: dnf_package_download
Message: There is not enough space on some file systems to perform the upgrade transaction.
Summary:
    Hint: Increase the free space on listed filesystems. Presented values are required minimum calculated by RPM and it is suggested to provide reasonably more free space (e.g. when 200 MB is missing on /usr, add 1200MB or more).
    Disk requirements: At least 1120MB more space needed on the / filesystem.
```

Faites de la place sur le disque, souvent nettoyer les volumes et layers non utilisés de de coker suffit :

```shell
docker system prune -a
```
