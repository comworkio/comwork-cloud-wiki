# Handling TLS/SSL certificates

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/tls.md)

## Letsencrypt

By default, the TLS/SSL cerficate are generated using [letsencrypt](https://letsencrypt.org/) using an ansible role you can replace by another if you want in your IaC[^1] repositories.

There's a crontab set which is supposed automatically renew your certificate:

```shell
$ cat /etc/cron.d/ansible_letsrenew 
#Ansible: letsencrypt cron
0 0 * */1 * root bash /root/letsrenew.sh
```

Note : to connect to the instance using SSH, follow [this tutorial](./ssh.md).

[^1]: _Infrastructure as Code_

## Troubleshooting

Sometimes, the letsencrypt API is not responding a success for some reasons (rates limiting, etc).

There's a logfile you can check to understand what's happened: `/root/letsencrypt.log`

You can also try to renew manually with this commands:

```shell
certbot renew --force-renewal
systemctl restart nginx # only if the previous command return a success
```
