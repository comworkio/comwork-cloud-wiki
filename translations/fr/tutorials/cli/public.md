# Commandes publiques

Vous trouverez ici comment utiliser `cwc` afin d'effectuer en ligne de commande les actions que vous feriez habituellement avec la [console web](../console/README.md). Cela vous facilitera l'automatisation de vos scripts et pipelines IaC[^1] (par exemples avec des shells scripts, rôles ansible, terraform, etc).

Remarques :
* Pour installer ou mettre à jour la ligne de commande `cwc`, [rendez-vous ici](./install.md).
* Pour les commandes accessibles aux administrateurs, [rendez-vous là](./admin.md)

[^1]: infrastructure as code

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/cli/public.md)

## Obtenir de l'aide

```shell
cwc help # or -h or --help for getting help
cwc version # or -v or --version for getting the current version
```

## Authentification

### Login

```shell
cwc login -a <access_key> -s <secret_key>
```

Pour créer un couple `access_key` et `secret_key`, voir [ce tutoriel](../api/api_credentials.md).

## Configuration par défaut

### Lire la configuration courante

```shell
cwc configure get endpoint
cwc configure get provider
cwc configure get region
cwc configure get format

```

### Configurer

Pour configurer l'url de l'API (default endpoint), la région, le format de sortie ou l'hébergeur (provider) :

```shell
cwc configure
```

Tapez sur ENTER si vous voulez conserver la valeur actuelle pour chacun des paramètres :

```shell
$ cwc configure
Default endpoint [https://cloud-api.comwork.io]: 
Default provider [ovh]: 
Default region [UK1]: 
Default format [json]: 

```

Vous pouvez lister les providers ou régions disponibles avec ces commandes :

```shell
cwc provider ls
cwc region ls # vous devez avoir setté le paramètre "provider" au préalable
```

Vous pouvez enfin configurer les paramètres individuellement comme ceci :

```shell
cwc configure set endpoint https://cloud-api.comwork.io
cwc configure set provider ovh
cwc configure set region UK1
cwc configure set format json

```

## Projets

### Lister

```shell
cwc project ls
```
```shell
cwc project ls -p # this flag will make the output
cwc project ls --pretty 
```

### Rechercher

#### Rechercher par ID

```shell
cwc project ls -p <project_id>
cwc project ls --id <project_id>
cwc project ls -P <project_id> -p # ou --pretty pour avoir la sortie jolie
```

#### Rechercher par nom

```shell
cwc project ls -n <project_name>
cwc project ls --name <project_name>
```

#### Rechercher par URL

```shell
cwc project ls -u <project_url>
cwc project ls --url <project_url>
```

### Créer

```shell
cwc project create -n <project_name>
```

Remarques : 

* Si vous souhaitez changer d'instance gitlab ou de group ou de compte utilisateur, il faudra utiliser ces options :
  * `-h` ou `--host`: Instance de gitlab
  * `-t` ou `--token`: Access token de gitlab
  * `-g` ou `--git`: Votre nom d'utilisateur git
  * `-n` ou `--namespace`: le namespace ou group id ou le projet git sera stocké

### Supprimer

#### Supprimer par ID

```shell
cwc project delete -p <project_id>
cwc project delete --id <project_id>
```


#### Supprimer par nom

```shell
cwc project delete -n <project_name>
cwc project delete --name <project_name>
```


#### Supprimer par URL

```shell
cwc project delete -u <project_url>
cwc project delete --url <project_url>
```

## Zones DNS

### Lister

```shell
cwc dnszones ls
```

## Environnements

#### Lister

```shell
cwc environment ls
cwc environment ls -p # ou --pretty pour avoir la sortie jolie
```

### Rechercher par ID

```shell
cwc environment ls -e <environment_id>
cwc environment ls --environment <environment_id>
cwc environment ls -e <environment_id> -p # ou --pretty pour avoir la sortie jolie
```

## Instances

### Lister les types d'instances disponibles

```shell
cwc instance type ls
```

### Lister les instances

```shell
cwc instance ls
cwc instance ls -p # ou --pretty pour avoir la sortie jolie
```

### Rechercher par ID

```shell
cwc instance ls -i <instance_id>
cwc instance ls --instance <instance_id>
cwc instance ls -i <instance_id> -p # ou --pretty pour avoir la sortie jolie
```

### Créer

```shell
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone>
```

Remarques : 
* utiliser la zone `nova` pour ovh ou `1` ou `2` pour scaleway
* `instance_type` correspond à la taille de l'instance (ex: `DEV1-M` for Scaleway)
* utiliser `--dns_zone` ou `-d` pour choisir la zone dns dans laquelle l'instance sera créee (vous pouvez voir les zones disponibles avec `cwc dnszones ls`)

### Attacher

```shell
cwc instance attach -n <playbook_name> -t <instance_type> -p <project_name> -z <zone>
```

Remarques : 
* utiliser la zone `nova` pour ovh ou `1` ou `2` pour scaleway
* `instance_type` correspond à la taille de l'instance (ex: `DEV1-M` for Scaleway)

### Mettre à jour le status

```shell
cwc instance update -i <instance_id> -s <action>
```

Remarques :
* Le statut doit être `poweroff`, `poweron` or `reboot`

### Supprimer

```shell
cwc instance delete -i <instance_id>
cwc instance delete --instance <instance_id>
```    

## Buckets / object storage

### Lister

```shell
cwc bucket ls
cwc bucket ls -p # ou --pretty pour avoir la sortie jolie
```

### Rechercher par ID

```shell
cwc bucket ls -b <bucket_id>
cwc bucket ls --bucket <bucket_id>
cwc bucket ls -b <bucket_id> -p # ou --pretty pour avoir la sortie jolie
```

### Mettre à jour les identifiants de connexion

```shell
cwc bucket update -b <bucket_id>
cwc bucket update --bucket <bucket_id>
```

### Supprimer

```shell
cwc bucket delete -b <bucket_id>
cwc bucket delete --bucket <bucket_id>
```    

## Registres OCI / Docker

### Lister

```shell
cwc registry ls
cwc registry ls -p # ou --pretty pour avoir la sortie jolie
```

### Rechercher par ID

```shell
cwc registry ls -r <registry_id>
cwc registry ls --registry <registry_id>
```

### Mettre à jour les identifiants de connexion

```shell
cwc registry update -r <registry_id>
cwc registry update --registry <registry_id>
cwc registry ls -r <registry_id> -p # ou --pretty pour avoir la sortie jolie
```

### Supprimer

```shell
cwc registry delete -r <registry_id>
cwc registry delete --registry <registry_id>
```
## Langages faas

## Liste des langues

```shell
cwc faas languages ls 
```
```shell
cwc faas languages ls -p 
cwc faas language ls --pretty
```
## Fonctions de Faas

### Lister

```shell
cwc faas function ls
cwc faas function ls -p # ou --pretty pour avoir la sortie jolie
```

### Recherche par Id

```shell
cwc faas function ls -f <function_id>
cwc faas function ls --function <function_id>
cwc faas function ls -f <function_id> -p # ou --pretty pour avoir la sortie jolie
```

## Créer

```shell
cwc faas function create -n <function_name> -l <language_name>
cwc faas function create --name <function_name> --language <language_name>
```
* Par défaut, la fonction créée est privée. Si vous ajoutez le flag `-p` ou `--public`, la fonction devient publique.

* Il y a d'autres flags optionnels pour la création directe:

```shell
-r ## Regexp of the function
## or
--regexp
```
```shell
-u ## Callback URL of the function
## or 
--callback-url
```
```shell
-a ## Callback Authorization Header of the function
## or
--callback-authorization-header
```
```shell
-g ## Arguments of the function
## or
--args
```
```shell
-c ## Code of the function
## or
--code
```
* Au lieu d'entrer les flags optionnels l'un derrière l'autre, vous pouvez entrer vos données avec le mode interactif en ajoutant `-i` ou `--interactive`.

### Mise à jour

```shell
cwc faas function update -f <function_id>
cwc faas function update --function <function_id>
```
Vous pouvez mettre à jour la fonction en passant par le mode interactif en ajoutant le flag `-i` ou `--interactive` ou vous pouvez passer vos données directement avec ces flags optionnels :
```shell
-l  ## Language of the function
## or
--language
```
```shell
-r ## Regexp of the function
## or
--regexp
```
```shell
-u ## Callback URL of the function
## or 
--callback-url
```
```shell
-a ## Callback Authorization Header of the function
## or
--callback-authorization-header
```
```shell
-g ## Arguments of the function
## or
--args
```
```shell
-c ## Code of the function
## or
--code
```

### 

```shell
cwc faas function delete -f <function_id>
cwc faas function delete --function <function_id>
```

## Faas invocation

### Lister

```shell
cwc faas invocation ls
cwc faas invocation ls -p # ou --pretty pour avoir la sortie jolie
```

### Recherche par Id

```shell
cwc faas invocation ls -i <invocation_id>
cwc faas invocation ls --invocation <invocation_id>
```
```shell
cwc faas invocation ls -i <invocation_id> -p
cwc faas invocation ls -i <invocation_id> --pretty
```
### Créer

```shell
cwc faas invocation create -f <function_id>
cwc faas invocation create --function <function_id>
```
* Il existe un autre indicateur facultatif pour la création directe:  
```shell
-a ## Arguments values of the function
## or
--args
```
```shell
-s ## Activer le mode synchrone
## or
--synchronous
```
* Au lieu d'entrer le drapeau optionnel, vous pouvez entrer vos données en mode interactif en ajoutant le drapeau `-i` ou `--interactive`.

### Supprimer

```shell
cwc faas invocation delete -i <invocation_id>
cwc faas invocation delete --invocation <invocation_id>
```

### Tronquer

```shell
cwc faas invocation truncate
```

## Faas Trigger

### Lister

```shell
cwc faas trigger ls
cwc faas trigger ls -p # ou --pretty pour avoir la sortie jolie
```

### Recherche par Id

```shell
cwc faas trigger ls -t  <trigger_id>
cwc faas trigger ls --trigger  <trigger_id>
cwc faas trigger ls -t  <trigger_id> -p # ou --pretty pour avoir la sortie jolie
```
## Liste des types de déclencheurs

```shell
cwc faas trigger kinds
cwc faas trigger kinds -p # ou --pretty pour avoir la sortie jolie
```

### Créer

```shell
cwc faas trigger create -f <function_id>
cwc faas trigger create --function <function_id>
```
* Il existe un autre indicateur facultatif pour la création directe:  
```shell
-n ## Trigger name
## or
--name
```
```shell
-k ## Trigger kind
## or
--kind
```
```shell
-c ## Trigger cron expression
## or
--cron_expr
```
```shell
-a ## Function arguments values
## or
--args
```
* Au lieu d'entrer le drapeau optionnel, vous pouvez entrer vos données en mode interactif en ajoutant le drapeau `-i` ou `--interactive`.

### Supprimer

```shell
cwc faas trigger delete -t  <trigger_id>
cwc faas trigger delete --trigger  <trigger_id>
```

### Tronquer

```shell
cwc faas trigger truncate
```