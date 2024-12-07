# Gérer les certifcats TLS/SSL

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/tls.md)

## Letsencrypt

Par défault, les certificats TLS/SSL sont générés en utilisant [letsencrypt](https://letsencrypt.org/) à partir d'un role ansible que vous pouvez changer dans votre repo IaC[^1].

Il y a une tâche cron configurée qui est supposée renouveler automatiquement les certificats après expiration :

```shell
cat /etc/cron.d/ansible_letsrenew 
#Ansible: letsencrypt cron
0 0 * */1 * root bash /root/letsrenew.sh
```

Note : pour vous connecter en SSH, suivez [ce tutoriel](./ssh.md).

[^1]: _Infrastructure as Code_

## Problèmes

Parfois l'API letsencrypt échoue pour différentes raisons comme un dépacement de quotas par exemple.

Il y a un fichier de log que vous pouvez consulter pour comprendre ce qui s'est passé : `/root/letsencrypt.log`

Vous pouvez enfin essayer de renouveler manuellement :

```shell
certbot renew --force-renewal
systemctl restart nginx # seulement si la commande précédente ne renvoi pas d'erreur
```
