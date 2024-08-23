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
$ bash almalinux-deploy.sh
```

If you have this error:

```shell
$ bash almalinux-deploy.sh
Check root privileges                                                 OK
Use '-d or --downgrade' option to allow downgrade from CentOS Stream  ERROR
```

Run this instead:

```shell
$ bash almalinux-deploy.sh -d
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

_Between 1 hour and 3 hour._

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

If you find `high (inhibitor)` issues you'll have to fix it. You'll find a list of the common error [here](#leapp-common-errors).

Once it's fixed, run the upgrade again:

```shell
$ leapp upgrade
```

Then you'll have a report like that:

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

Open a web/kvm console of your virtual machine in order to access to the grup menu and restart:

```shell
$ reboot
```

Then, __quickly__ select the `ELevate-Upgrade-Initramfs` entry:

![grub_upgrade_almalinux](../img/grub_upgrade_almalinux.png)

Then let the upgrade continue on the kvm/web console, the reboot will be automatic.

Once it's finished, open a new SSH connection and check:

```shell
$ cat /etc/redhat-release
AlmaLinux release 9.3 (Shamrock Pampas Cat)
$ dnf update -y
$ dnf upgrade -y
```

Run those commands to fix the ansible pipeline[^1]:

```shell
$ pip install hvac
$ dnf install snapd -y
```

[^1]: once everything is upgraded, you should update the `common` ansible role to automatize this.

And to finish, in the ansible configuration, update the following variables and relaunch a pipeline:

```shell
centos_version: 9
docker_legacy_repo_install: false
docker_repo_install: true
```

You might have to update your ansible role to replace the `docker-compose` command by `docker compose` and remove all containers in order to recreate them:

```shell
$ docker ps -a|awk '{system ("docker rm -f "$1)}'
```

## Leapp common errors

Here you'll find a list of the common errors you can encounter during the `leapp preupgrade` or `leapp upgrade` commands.

### Symbolic links which point to absolute paths

Example of message you'll get:

```
Risk Factor: high (inhibitor)
Title: Upgrade requires links in root directory to be relative
Summary: After rebooting, parts of the upgrade process can fail if symbolic links in / point to absolute paths.
Please change these links to relative ones.
Remediation: [command] sh -c ln -snf var/lib/snapd/snap /snap
Key: XXXXX
```

You have to fix it, like that:

```shell
cd /
ln -snf var/lib/snapd/snap /snap
```

### Custom network-scripts detected

Example of message you'll get:

```
Risk Factor: high (inhibitor)
Title: custom network-scripts detected
Summary: RHEL 9 does not support the legacy network-scripts package that was deprecated in RHEL 8. Custom network-scripts have been detected.
Remediation: [hint] Migrate the custom network-scripts to NetworkManager dispatcher scripts manually before the upgrade. Follow instructions in the official documentation.
Key: XXXXX
```

You have to fix it, like that:   

```shell
$ mkdir /opt/network-scripts/
$ mv /sbin/if*-local /opt/network-scripts/
```

Create the `/etc/NetworkManager/dispatcher.d/20-if-local` file with the following content: 

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

Set the permissions on the /etc/NetworkManager/dispatcher.d/20-if-local script: 

```shell
$ chown root:root /etc/NetworkManager/dispatcher.d/20-if-local
$ chmod +x /etc/NetworkManager/dispatcher.d/20-if-local
$ restorecon /etc/NetworkManager/dispatcher.d/20-if-local
```

If you require pre-up or pre-down events, create a symbolic link in the corresponding dispatcher directory:   

```shell
ln -s ../20-if-local /etc/NetworkManager/dispatcher.d/pre-up.d/
ln -s ../20-if-local /etc/NetworkManager/dispatcher.d/pre-down.d/
```

All these instructions are in [the official documentation of Redhat](https://access.redhat.com/solutions/6900331).

### Not enough disk space

Example of message you'll get:

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

You have to clean a little bit. Most of the time, cleaning docker unused volumes or layers is sufficient:

```shell
docker system prune -a
```
