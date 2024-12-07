# Mastodon as a service

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/mastodon.md)

## Démarrage

Vous venez juste de provisionner votre instance Mastodon, vous obtenez le message d'erreur suivant en ouvrant l'URL `https://{your_instance_hash}.mastodon.comwork.(cloud|dev|info)` dans votre navigateur : 

![mastodon_error](../../../img/mastodon_error.png)

C'est tout à fait normal, l'instance n'est pas encore prête et il va falloir suivre les étapes suivantes pour qu'elle le soit :

**1/** Connectez-vous avec [ssh](./ssh.md)

**2/** Exécuter les commandes suivantes dans la session SSH :

```shell
sudo su -
docker-compose -f docker-compose-mastodon.yml run --rm shell bundle exec rake secret
```

Changer la valeur de la variable suivante avec celle obtenue via la commande précédente dans votre fichier d'environnement ansible (`env/{ instance_hash }.yml`) :

```yaml
mastodon_secret_key: changeit
```

**3/** Executez la commande suivante dans la session SSH :

```shell
sudo su -
docker-compose -f docker-compose-mastodon.yml run --rm shell bundle exec rake mastodon:webpush:generate_vapid_key
```

Changer la valeur des variables suivante avec celles obtenues via la commande précédente (prendre les valeurs à droite du signe `=`) dans votre fichier d'environnement ansible (`env/{ instance_hash }.yml`) :

```yaml
mastodon_vapid_private_key: changeit
mastodon_vapid_public_key: changeit
```

**4/** Mettre également à jour cette variable (remplacer `"true"` par `"false"`) :

```yaml
pgsql_first_install: "false"
```

Pusher sur la branche `main` de votre repo gitlab.

**5/** L'instance sera prête et accessible avec l'URL `https://{your_instance_hash}.mastodon.comwork.(cloud|dev|info)`, allez-y et enregistrer votre compte utilisateur :

![mastodon_register](../../../img/mastodon_register.png)

**6/** Sur la même session SSH ouverte précédemment, lancer cette commande rake pour donner les droit d'administrateur à l'utilisateur que vous venez juste d'enregistrer :

```shell
sudo su -
docker-compose -f docker-compose-mastodon.yml run -e USERNAME=YOUR_USERNAME --rm shell bundle exec rake comwork:set_admin
```

Remplacer `YOUR_USERNAME` par celui que vous avez choisi.

## Automatisation des paramètres de façon gitops

Nous fournissons également ce projet : [mastodon-term-services](https://gitlab.comwork.io/oss/mastodon-term-services) afin d'automatiser dans un mode "gitops" les changements de paramètres suivants :

* Les conditions d'utilisateurs (_Term of services_) au format HTML
* La liste des règles à respecter par les utilisateurs
* La liste des instances de Mastodon bloquées par cette instance

N'hésitez pas à forker ce repo afin d'établir vos propres règles et conditions d'utilisation.
