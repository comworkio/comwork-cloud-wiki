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

If you find `high (inhibitor)` issues like that:

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

Run the upgrade :

```shell
$ leapp upgrade
```

If you have an issue such as not enough space on your disk, like that:

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

Then, run the upgrade again:

```shell
$ leapp upgrade
```
