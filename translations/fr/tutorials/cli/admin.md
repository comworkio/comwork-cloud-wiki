# Commandes administrateurs

Les commandes administateurs sont utilisées pour gérer votre instance de CwCloud auto-hébergée.

Remarques :
* Ces commandes ne fonctionnent que pour les utilisateurs qui sont administrateurs (si vous utilisez une [version auto-hébergées](../selfhosted/README.md) par exemple)
* Pour installer ou mettre à jour la ligne de commande `cwc`, [rendez-vous ici](./install.md).
* Pour les commandes accessibles à tous les utilisateurs, [rendez-vous là](./public.md)

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/cli/admin.md)

## Utilisateurs

### Lister

```shell
cwc admin user ls
```

### Get user by ID

```shell
cwc admin user ls -u <user_id>
cwc admin user ls --user <user_id>
```

### Supprimer

```shell
cwc admin user delete -u <user_id>
cwc admin user delete --user <user_id>
```

## Projets

### Lister

```shell
cwc admin project ls
```

### Rechercher des projets

#### Rechercher par ID

```shell
cwc admin project ls -p <project_id>
cwc admin project ls --id <project_id>
```

#### Rechercher par nom

```shell
cwc admin project ls -n <project_name>
cwc admin project ls --name <project_name>
```

#### Rechercher par URL

```shell
cwc admin project ls -u <project_url>
cwc admin project ls --url <project_url>
```

### Créer

```shell
cwc admin project create -n <project_name>
```

Remarques : 
* Si vous souhaitez changer d'instance gitlab ou de group ou de compte utilisateur, il faudra utiliser ces options :
  * `-h` ou `--host`: Instance de gitlab
  * `-t` ou `--token`: Access token de gitlab
  * `-g` ou `--git`: Votre nom d'utilisateur git
  * `-n` ou `--namespace`: le namespace ou group id ou le projet git sera stocké
  * `-p` ou `--type`: le type de projet

### Supprimer

#### Delete Project By ID

```shell
cwc admin project delete -p <project_id>
cwc admin project delete --id <project_id>
```

#### Delete Project By Name

```shell
cwc admin project delete -n <project_name>
cwc admin project delete --name <project_name>
```

#### Delete Project By URL

```shell
cwc admin project delete -u <project_url>
cwc admin project delete --url <project_url>
```

## Environnements

### Créer

```shell
cwc admin environment create -n <name> -r <role1>,<role2>  -m <main_role> -p <path> -d <description> -s <subdomain1>,<subdomain2>
cwc admin environment create --name <name> --roles <role1>,<role2>  -main-role <main_role> --path <path> --description <description> --subdomains <subdomain1>,<subdomain2>
```

Remarque : Si vous voulez rendre l'environnement privé (accessible qu'aux administrateurs), utilisez l'option `-a` ou `--private`.

### Lister

```shell
cwc admin environment ls
```

### Rechercher par ID

```shell
cwc admin environment ls -e <environment_id>
cwc admin environment ls --environment <environment_id>
cwc admin environment ls -e <environment_id> -p
```

## Instances

### Lister

```shell
cwc admin instance ls
```

### Rechercher par ID

```shell
cwc admin instance ls -i <instance_id>
cwc admin instance ls --instance <instance_id>
cwc admin instance ls -i <instance_id> -p
```

### Créer pour un(e) utilisateur

```shell
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone> -m <user_mail>
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone> -m <user_mail>
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone> -m <user_mail>
```

Remarques : 
* utiliser la zone `nova` pour ovh ou `1` ou `2` pour scaleway
* `instance_type` correspond à la taille de l'instance (ex: `DEV1-M` for Scaleway)
* utiliser `--dns_zone` ou `-d` pour choisir la zone dns dans laquelle l'instance sera créee (vous pouvez voir les zones disponibles avec `cwc dnszones ls`)

### Mettre à jour le status

```shell
cwc admin instance update -i <instance_id> -s <action>
cwc admin instance update --instance <instance_id> --status <action>
```

Note: status must be `poweroff`, `poweron` or `reboot`

### Supprimer

```shell
cwc admin instance delete -i <instance_id>
cwc admin instance delete --instance <instance_id>
```

### Raffraichir le state

```shell
cwc admin instance refresh -i <instance_id>
cwc admin instance refresh --instance <instance_id>
```

## Buckets / object storage

### Ajouter pour un(e) utilisateur

```shell
cwc admin bucket create -n <bucket_name> -t <bucket_type> -u <user_mail>
cwc admin bucket create --name <bucket_name> --type <bucket_type> --user <user_mail>
```

### Lister

```shell
cwc admin bucket ls
```

### Rechercher par ID

```shell
cwc admin bucket ls -b <bucket_id>
cwc admin bucket ls --bucket <bucket_id>
```

### Renouveler les identifiants de connexion

```shell
cwc admin renew update -b <bucket_id>
cwc admin renew update --bucket <bucket_id>
```

### Transfert à un autre utilisateur

```shell
cwc admin bucket transfer -b <bucket_id> -e <récepteur_email>
cwc admin bucket transfer --bucket <bucket_id> --email <récepteur_email>
```

### Supprimer

```shell
cwc admin bucket delete -b <bucket_id>
cwc admin bucket delete --bucket <bucket_id>
```    

## Registres OCI / Docker

### Ajouter pour un(e) utilisateur

```shell
cwc admin registry create -n <registry_name> -t <registry_type> -u <user_mail>
cwc admin registry create --name <registry_name> --type <registry_type> --user <user_mail>
```

### Lister

```shell
cwc admin registry ls
```

### Rechercher par ID

```shell
cwc admin registry ls -r <registry_id>
cwc admin registry ls --registry <registry_id>
```

### Mettre à jour les identifiants de connexion

```shell
cwc admin registry update -r <registry_id>
cwc admin registry update --registry <registry_id>
```

### Transfert à un autre utilisateur

```shell
cwc admin registry update -r <registry_id> -t <récepteur_email>
cwc admin registry update --registry <registry_id> --transfer <récepteur_email>
```

### Supprimer

```shell
cwc admin registry delete -r <registry_id>
cwc admin registry delete --registry <registry_id>
```

## Emails

### Envoyer des emails

```shell
cwc admin email -f from@provider.com -t to@provider.com -s subject -c content -m false
cwc admin email --from from@provider.com --to to@provider.com --subject subject --content content --templated false
```
## Fonction Faas

### Lister

```shell
cwc admin faas function ls
```

### Obtenir le propriétaire

```shell
cwc admin faas function ls -f <function_id>
cwc admin faas function ls --function <function_id>
```

## Invocation des faas

### Lister

```shell
cwc admin faas invocation ls
```

### Obtenir l'invocateur

```shell
cwc admin faas invocation ls -i <invocation_id>
cwc admin faas invocation ls --invocation <invocation_id>
```

## Déclencheur Faas

### Lister

```shell
cwc admin faas trigger ls
```

### Obtenir le propriétaire

```shell
cwc admin faas trigger ls -t  <trigger_id>
cwc admin faas trigger ls --trigger  <trigger_id>
```

## Kubernetes
### Environnement
#### Liste de tous les environnements
```shell
cwc admin kubernetes environment ls
```

### Cluster
#### Liste de tous les clusters
```shell
cwc admin kubernetes cluster ls
```

#### Supprimer cluster par Id
```shell
cwc admin kubernetes cluster delete -c <id_de_cluster>
## or
cwc admin kubernetes cluster delete --cluster <id_de_cluster>
```

## Email

### Envoyer un email

Vous pouvez envoyer un email avec la commande suivante :

```shell
cwc email -t <recepient_email> -s <subject> -c <content>
```

Notes :
* Il existe d'autres options que vous pouvez ajouter :
  * `-f` pour ajouter une adresse email personnalisée de l'expéditeur
  * `-b` pour ajouter une adresse email bcc
  * `-t` pour activer l'utilisation de template de comwork cloud

## Enregistrements DNS

## Liste de tous les enregistrements DNS disponibles

Vous pouvez lister tous les enregistrements DNS disponibles en fonction du fournisseur préconfiguré :

```shell
cwc admin dnsRecord ls
```

## Créer un enregistrement DNS

```shell
cwc admin dnsRecord create -n <nom_de_enregistrement> -z <zone> -t <type> -l <ttl> -d <data>
## ou
cwc admin dnsRecord create --name <nom_de_enregistrement> --zone <zone> --type <type> -ttl <ttl> -d <data>
```

## Supprimer un enregistrement DNS

```shell
cwc admin dnsRecord delete -r <id_de_enregistrement> -n <nom_de_enregistrement> -z <zone>
## ou
cwc admin dnsRecord delete --record <id_de_enregistrement> --name <nom_de_enregistrement> --zone <zone>
```

## Moniteurs

### Liste

```shell
cwc admin monitor ls
```

### Obtenir un moniteur par ID

```shell
cwc admin monitor ls -m <monitor_id>
cwc admin monitor ls --id <monitor_id>
```

Notes :
* Utilisez le flag `-p` ou `--pretty` pour formater la sortie de manière plus lisible

### Création

```shell
cwc admin monitor create -n <nom> -u <url> [options]
```

Flags requis :
* `-n` ou `--name` : Nom du moniteur
* `-u` ou `--url` : URL à surveiller
* `-i` ou `--user_id` : ID de l'utilisateur

Flags optionnels :
* `-y` ou `--type` : Type de moniteur (http, tcp, icmp) - par défaut : "http"
* `-f` ou `--family` : Famille du moniteur
* `-m` ou `--method` : Méthode HTTP (GET, POST, PUT) - par défaut : "GET"
* `-e` ou `--expected_http_code` : Code de réponse HTTP attendu - par défaut : "20*"
* `-b` ou `--body` : Corps de la requête - par défaut : "hello"
* `-c` ou `--expected_contain` : Contenu attendu dans la réponse
* `-t` ou `--timeout` : Délai d'expiration de la requête en secondes - par défaut : 30
* `-s` ou `--username` : Nom d'utilisateur pour l'authentification basique
* `-p` ou `--password` : Mot de passe pour l'authentification basique
* `-H` ou `--headers` : En-têtes de la requête au format "cle1:valeur1,cle2:valeur2"

### Mise à jour

```shell
cwc admin monitor update -m <monitor_id> [options]
```

Flags requis :
* `-m` ou `--id` : ID du moniteur à mettre à jour

Flags optionnels :
* `-y` ou `--type` : Type de moniteur (http, tcp, icmp) - par défaut : "http"
* `-n` ou `--name` : Nom du moniteur
* `-f` ou `--family` : Famille du moniteur
* `-u` ou `--url` : URL à surveiller
* `-M` ou `--method` : Méthode HTTP (GET, POST, PUT) - par défaut : "GET"
* `-e` ou `--expected_http_code` : Code de réponse HTTP attendu - par défaut : "20*"
* `-b` ou `--body` : Corps de la requête
* `-c` ou `--expected_contain` : Contenu attendu dans la réponse
* `-t` ou `--timeout` : Délai d'expiration de la requête en secondes - par défaut : 30
* `-s` ou `--username` : Nom d'utilisateur pour l'authentification basique
* `-p` ou `--password` : Mot de passe pour l'authentification basique
* `-H` ou `--headers` : En-têtes de la requête au format "cle1:valeur1,cle2:valeur2"
* `-I` ou `--user_id` : ID de l'utilisateur

### Suppression

```shell
cwc admin monitor delete -m <monitor_id>
cwc admin monitor delete --monitor <monitor_id>
```
