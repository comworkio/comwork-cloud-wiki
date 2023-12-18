# Commandes administrateurs

Les commandes administateurs sont utilisées pour gérer votre instance de CwCloud auto-hébergée.

Remarques :
* Ces commandes ne fonctionnent que pour les utilisateurs qui sont administrateurs (si vous utilisez une [version auto-hébergées](../selfhosted.md) par exemple)
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

### Mettre à jour les identifiants de connexion

```shell
cwc admin bucket update -b <bucket_id>
cwc admin bucket update --bucket <bucket_id>
```

### Transfert à un autre utilisateur

```shell
cwc admin bucket update -b <bucket_id> -t <récepteur_email>
cwc admin bucket update --bucket <bucket_id> --transfer <récepteur_email>
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
