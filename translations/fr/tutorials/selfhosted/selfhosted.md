# Auto-hébergement de CwCloud

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../tutorials/selfhosted.md)


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
