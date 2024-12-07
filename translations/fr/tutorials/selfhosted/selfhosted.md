# Auto-hébergement de CwCloud

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../tutorials/selfhosted.md)

## Configurer CwCloud pour OVH

Dans cette partie nous allons voir comment générer les différentes clefs d'API pour OVH.

### Valeurs constantes

Ces valeurs sont constantes et ne devraient pas changer :

```shell
OVH_ENDPOINT="ovh-eu"
OS_AUTH_URL="https://auth.cloud.ovh.net/v3/"
```

### Créer un projet de cloud public

Créer un projet s'il n'en existe pas :

![ovh_public_cloud_project](../../../img/ovh_public_cloud_project.png)

Copier l'id du projet dans la variable suivante :

```shell
OVH_SERVICENAME="d89XXXXXXXX"
```

### Créer un utilisateur cloud public

![ovh_public_cloud_user_1](../../../img/ovh_public_cloud_user_1.png)

![ovh_public_cloud_user_2](../../../img/ovh_public_cloud_user_2.png)

Stocker le username et le mot de passe dans les variables suivantes :

```shell
OS_USERNAME="user-5hXXXXXXX9"
OS_PASSWORD="tBXXXXXXXXXXXXXXXXXXXF5"
```

### API OpenStack

Vous pouvez vous connecter sur l'IHM d'OpenStack avec les identifiants précédants : https://horizon.cloud.ovh.net/

![ovh_openstack_gui](../../../img/ovh_openstack_gui.png)

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

![ovh_create_token](../../../img/ovh_create_token.png)

Une fois fait vous devez garder les valeurs suivantes :

![ovh_cacloud_api_token](../../../img/ovh_cacloud_api_token.png)

Et les associer aux variables d'environnement suivantes :

```shell
OVH_APPLICATION_KEY="c3XXXXXXXXXXe"
OVH_APPLICATION_SECRET="e8XXXXXXXXXXX36"
OVH_CONSUMER_KEY="c4XXXXXXXXXX90a"
```

### Créer une zone DNS

Il faut tout simplement acheter un nom de domaine qui sera dynamiquement géré par CwCloud et dont les zones DNS __ne doivent pas être gérées par un autre service ou processus__.

![ovh_dns_zone](../../../img/ovh_dns_zone.png)

Après avoir crée la première instance qui va héberger CwCloud avec une IP publique, il faudra ajouter un champs `A` vers cette IP publique avec un sous-domaine tel que `cwcloud.xxxxx.com`.

### Golden images avec packer et ansible

Vous devrez créer une image qui contient git et ansible pour accélérer les déploiements.

Pour cela, suivez les indications de ce repository : https://gitlab.comwork.io/oss/cwc/golden-images-ovh

## Configurer CwCloud avec AWS

Dans cette section, nous verrons comment générer des clés d'accès et des clés secrètes avec AWS. Ensuite, nous verrons comment obtenir l'ID de sous-réseau pour chaque zone de disponibilité (a, b, c,...), l'ID du groupe de sécurité ainsi que l'ID de la zone DNS hébergée.

### Choisir une région

Sur la droite de la page d'accueil de la console, vous pouvez trouver une liste de toutes les régions activées dans votre compte. Choisissez la région la plus proche de votre lieu de travail :

Vous pouvez écrire la valeur de la région dans cette variable d'environnement :

```shell
AWS_STRATEGY_DEFAULT_REGION="xx-xxxx-x"
```

![aws_1](../../../img/aws_regions5.png)

### Créer un utilisateur

Nous devons d'abord créer un utilisateur à partir duquel nous générons les clés. Rechercher IAM :

![aws_1](../../../img/aws_1.png)

Cliquez sur Users: 

![aws_2](../../../img/aws_users.png)

![aws_2](../../../img/aws_adduser.png)

Vous devez suivre un processus de trois étapes:

1. Écrivez le nom de l'utilisateur

2. Définissez ses autorisations

![aws_4](../../../img/aws_4.png)

3. Enfin créer l'utilisateur.

![aws_rcreate_user](../../../img/aws_rcreate_user.png)

### Créer les clés d'accés et les clés secrets

Sélectionnez l'utilisateur créé puis cliquez sur "identifiants de sécurité" :

![aws_access](../../../img/aws_access.png)

On descend dans la page de l'utilisateur selectionné :

![aws_5](../../../img/aws_5.png)

Choisissez l'option Interface de ligne de commande (CLI), puis rédigez une description (facultatif). Enfin, créez la clé.

![aws_6](../../../img/aws_6.png)

Ensuite, vous pouvez obtenir votre clé d'accès et votre clé secrète afin de pouvoir les écrire dans ces variables d'environnement :

```shell
AWS_STRATEGY_ACCESS_KEY_ID="AKIxxxxxxxxxxxxxxxxx"
AWS_STRATEGY_SECRET_ACCESS_KEY="qvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

![aws_7](../../../img/aws_7.png)

### Obtenir l'ID du sous-réseau

Tapez VPC dans la barre de recherche :

![aws_8](../../../img/aws_8_vpc.png)

Selectionnez le VPC que vous voulez utiliser :

![aws_sebnet1](../../../img/aws_subnets.png)

Vous pouvez trouver l'ID de sous-réseau pour chaque zone de disponibilité (a, b, c...) :

![aws_subnet2](../../../img/aws_vpc_hierarchy.png)

Vous choisissez les ID de sous-réseau en fonction de chaque zone de disponibilité. Vous pouvez écrire l'ID de sous-réseau dans le fichier yaml des environnements cloud :

```shell
- region: xx-xxxx-x
        zones:
          - name: "x"
            subnet: subnet-048XXXXXXXXXXXXXX
```

### Obtenir l'ID du groupe de securité

Dans la barre latérale gauche, choisissez Groupes de sécurité :

![aws_sg1](../../../img/aws_sg1.png)

Vous choisissez les ID de sous-réseau en fonction de chaque région et zone de disponibilité (a, b, c...). Vous pouvez écrire l'ID du groupe de sécurité dans le fichier yaml des environnements cloud :

![aws_9_sg_list2](../../../img/aws_9_sg_list2.png)

```shell
- region: xx-xxxx-x
        zones:
          - name: "x"
            subnet: subnet-048XXXXXXXXXXXXXX
            sg: sg-0266XXXXXXXXXXXXX    
```

### Obtenir l'ID de la zone DNS hebergée

Chercher "Route53" :

![aws_route53_1](../../../img/aws_route53_1.png)

Vous devez acheter un domaine afin d'obtenir automatiquement une zone hébergée :

![aws_route53_1](../../../img/aws_route53_2.png)

Vous pouvez écrire l'ID de la zone DNS hébergée du fichier yaml des environnements cloud :

```shell
dns_hosted_zone_id: Z08XXXXXXXXXXXXXXXXB 
```

![aws_route53_1](../../../img/aws_route53_3.png)

## Configurer CwCloud avec GCP

### Obtenir l'ID du projet

Copier/coller la valeur suivante dans la variable d'environnement `GCP_PROJECT_ID` :

![gcp_project_id](../../../img/gcp_project_id.png)

### Générer le service account et ses permissions

Créer un service account `cwcloud`

Ensuite, lui ajouter le role `owner` comme ceci :

![gcp_sa_access_1](../../../img/gcp_sa_access_1.png)

![gcp_sa_access_2](../../../img/gcp_sa_access_2.png)

Le service account doit aussi apparaitre dans les comptes principaux :

![gcp_iam_sa_principal](../../../img/gcp_iam_sa_principal.png)

### Générer la clef d'authentification

Aller dans _IAM > Service Account > Manage key_

![gcp_sa_manage_keys](../../../img/gcp_sa_manage_keys.png)

Ensuite, créer une nouvelle clef (choisir le format `JSON`) :

![gcp_sa_add_key](../../../img/gcp_sa_add_key.png)

Le fichier téléchargé devrait ressembler à quelque chose comme ceci :

```json
{
  "type": "service_account",
  "project_id": "projectid",
  "private_key_id": "22fXXXXXXXXXXXXXXXXXXX",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvYYYYYYYYYYYYYYYYYY4G4A=\n-----END PRIVATE KEY-----\n",
  "client_email": "cwcloud@projectid.iam.gserviceaccount.com",
  "client_id": "ZZZZZZZZZZZZZZZZ",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/cwcloud%40projectid.iam.gserviceaccount.com",
  "universe_domain": "googleapis.com"
}
```

Ensuite enregistrer la valeur en base64 de ce fichier dans la variable d'environnement `GCP_APPLICATION_CREDENTIALS`.

Vous pouvez utiliser cette commande pour générer la valeur en base64 :

```shell
base64 -i projectid.json
```

### Configuration du réseau

Créer un réseau `default` comme ceci :

![gcp_vpc_network](../../../img/gcp_vpc_network.png)

Voici le code terraform pour y parvenir :

```hcl
variable "project_id" {
  type        = string
  description = "The GCP project ID"
  default     = null
}

resource "google_compute_network" "vpc_network" {
  project                 = var.project_id
  name                    = "default"
  auto_create_subnetworks = true
}
```

Vous pouvez ensuite stocker la valeur `default` dans la variable d'environnement `GCP_NETWORK`.

### Configuration des firewalls

Voici le code terraform :

```hcl
variable "project_id" {
  type        = string
  description = "The GCP project ID"
  default     = null
}

variable "network" {
  type        = string
  description = "The GCP vpc/network name"
  default     = null
}

resource "google_compute_firewall" "allow_ssh" {
  name    = "allow-ssh"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["22"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-ssh"]
}

resource "google_compute_firewall" "allow_http" {
  name    = "allow-http"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["80"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-http"]
}

resource "google_compute_firewall" "allow_https" {
  name    = "allow-https"
  network = var.network
  project = var.project_id

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["allow-https"]
}
```

Ensuite vous pouvez ajouter les tags dans le fichier `cloud_environments.yml` :

```yaml
firewall_tags:
  - allow-http
  - allow-https
  - allow-ssh
```

## Configurer une zone DNS avec cloudflare

1. Ajouter un nouveau site avec cloudflare:

![cloudflare_add_website](../../../img/cloudflare_add_website.png)

1. Enregistrer votre nom de domaine avec le Free Plan, puis copier les DNS:

![cloudflare_copy_dns](../../../img/cloudflare_copy_dns.png)

3. Mettre à jour les serveur DNS, exemple avec OVH:

![update_dns_ovh](../../../img/update_dns_ovh.png)

Remplacer ici les serveurs `dns12.ovh.net` et `ns12.ovh.net` par ceux de cloudflare que vous avez copié juste avant.

Attendre un peu (jusqu'à 24h), les serveurs DNS devraient apparaitre à jour comme ceci:

![updated_dns_server_ovh](../../../img/updated_dns_server_ovh.png)

4. Créer un token d'API pour votre instance cwcloud :

![cloudflare_api_token_1](../../../img/cloudflare_api_token_1.png)

ensuite:

![cloudflare_api_token_2](../../../img/cloudflare_api_token_2.png)

Ensuite choisir le bon template :

![cloudflare_api_token_3](../../../img/cloudflare_api_token_3.png)

Ensuite choisir la zone DNS :

![cloudflare_api_token_4](../../../img/cloudflare_api_token_4.png)

Copier/coller le token généré :

![cloudflare_api_token_5](../../../img/cloudflare_api_token_5.png)

Vous devez setter la variable d'environnement `CLOUDFLARE_API_TOKEN` avec ce token.

5. Vous pouvez ensuite ajouter votre nouvelle zone DNS dans le fichier `cloud_environments.yml` :

```yaml
dns_zones:
  - name: pulumi-university.com
    driver: CloudflareDriver
    zone_id: XXXXXXX
```

Pour récupérer la `zone_id`, copier la valeur suivante depuis cloudflare :

![cloudflare_zone_id](../../../img/cloudflare_zone_id.png)
