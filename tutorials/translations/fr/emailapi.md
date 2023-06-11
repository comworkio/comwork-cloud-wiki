# Email API

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../emailapi.md)

## Activer cette API

Dans la version SaaS, vous pouvez demander d'accéder à cette API en utilisant le [système de support](./console/public/support.md).

Si vous êtes administrateur de cette instance, vous pouvez autoriser les utilisateurs comme ceci :

![emailapi_enable](../../../img/emailapi_enable.png)

## Formulaire

Une fois que vous êtes activé, vous pouvez utiliser l'API au travers de cette interface :

![emailapi_form](../../../img/emailapi_form.png)

## Utiliser l'API

Vous pouvez utiliser cet endpoint dans vos applications pour envoyer des emails :

![emailapi_endpoint](../../../img/emailapi_endpoint.png)

Voici ce que cela donne avec `curl` :

```shell
curl -X 'POST' \
  'https://cloud-api.comwork.io/v1/email' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -H 'X-Auth-Token: XXXXXX' \
  -d '{
    "from": "cloud@provider.com",
    "to": "recipient@provider.com",
    "bcc": "bcc@provider.com",
    "subject": "Subject",
    "content": "Content"
  }'
```

Notes :
* Si vous êtes sur la version Tunisienne, remplacer `cloud-api.comwork.io` par `api.cwcloud.tn`
* Vous devez remplacer la valeur `XXXXXX` avec votre propre token généré via [cette procédure](./api/api_credentials.md).

## Plugins pour CMS

### Plugin pour wordpress

Vous pouvez télécharger ce [plugin](https://gitlab.comwork.io/oss/cwc/cwcloud-wordpress-email):

**1/** Télécharger la bonne extension (soit la `-io` si vous utilisez l'instance [cloud.comwork.io](https://cloud.comwork.io), soit la `-tn` si vous utilisez l'instance [cwcloud.tn](https://www.cwcloud.tn))

![wpaas_email_ext1](../../../img/wpaas_email_ext1.png)

**2/** Congigurer l'extension :

Générer des clefs d'API. Vous pouvez aller voir [ce tutoriel](./api/api_credentials.md)

Ensuite copier/coller la clef secrète ici :

![wpaas_email_ext2](../../../img/wpaas_email_ext2.png)
