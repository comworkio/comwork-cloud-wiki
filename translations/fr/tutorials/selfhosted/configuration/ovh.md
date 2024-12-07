# Configurer OVH

Dans ce tutoriel nous allons voir comment générer les différentes clefs d'API pour OVH.

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/configuration/ovh.md)

## Configuration

### Valeurs constantes

Ces valeurs sont constantes et ne devraient pas changer :

```shell
OVH_ENDPOINT="ovh-eu"
OS_AUTH_URL="https://auth.cloud.ovh.net/v3/"
```

### Créer un projet de cloud public

Créer un projet s'il n'en existe pas :

![ovh_public_cloud_project](../../../../../img/ovh_public_cloud_project.png)

Copier l'id du projet dans la variable suivante :

```shell
OVH_SERVICENAME="d89XXXXXXXX"
```

### Créer un utilisateur cloud public

![ovh_public_cloud_user_1](../../../../../img/ovh_public_cloud_user_1.png)

![ovh_public_cloud_user_2](../../../../../img/ovh_public_cloud_user_2.png)

Stocker le username et le mot de passe dans les variables suivantes :

```shell
OS_USERNAME="user-5hXXXXXXX9"
OS_PASSWORD="tBXXXXXXXXXXXXXXXXXXXF5"
```

### API OpenStack

Vous pouvez vous connecter sur l'IHM d'OpenStack avec les identifiants précédants : https://horizon.cloud.ovh.net/

![ovh_openstack_gui](../../../../../img/ovh_openstack_gui.png)

Vous pouvez valoriser la variable suivante avec la valeur soulignée en rouge (le "_tenant_") :

```shell
OS_TENANT_NAME="48XXXXXXXX38"
```

### API CaCloud

Pour créer un token, aller sur : https://www.ovh.com/auth/api/createToken

Faire attention aux détails suivants :

- Il faut mettre un caractère `*` en face de chaque verbe HTTP (GET/PUT/POST/DELETE). Cliquer sur `+` s'il manque ces verbe http pour les ajouter un par un
- _Unlimited_ pour la durée

Comme sur cette capture :

![ovh_create_token](../../../../../img/ovh_create_token.png)

Une fois fait vous devez garder les valeurs suivantes :

![ovh_cacloud_api_token](../../../../../img/ovh_cacloud_api_token.png)

Et les associer aux variables d'environnement suivantes :

```shell
OVH_APPLICATION_KEY="c3XXXXXXXXXXe"
OVH_APPLICATION_SECRET="e8XXXXXXXXXXX36"
OVH_CONSUMER_KEY="c4XXXXXXXXXX90a"
```

### Créer une zone DNS

Il faut tout simplement acheter un nom de domaine qui sera dynamiquement géré par CwCloud et dont les zones DNS __ne doivent pas être gérées par un autre service ou processus__.

![ovh_dns_zone](../../../../../img/ovh_dns_zone.png)

Après avoir crée la première instance qui va héberger CwCloud avec une IP publique, il faudra ajouter un champs `A` vers cette IP publique avec un sous-domaine tel que `cwcloud.xxxxx.com`.

### Golden images avec packer et ansible

Vous devrez créer une image qui contient git et ansible pour accélérer les déploiements.

Pour cela, suivez les indications de ce repository : https://gitlab.comwork.io/oss/cwc/golden-images-ovh
