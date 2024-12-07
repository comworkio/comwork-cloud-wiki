# Configuring GCP

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/configuration/gcp.md)

## Configuration

### Get the project ID

Copy/paste the following value in the `GCP_PROJECT_ID` environment variable:

![gcp_project_id](../../../img/gcp_project_id.png)

### Generate service account

Create a service account `cwcloud`

Then, grant it the access `owner`:

![gcp_sa_access_1](../../../img/gcp_sa_access_1.png)

![gcp_sa_access_2](../../../img/gcp_sa_access_2.png)

The service account has also to appear in the principals account:

![gcp_iam_sa_principal](../../../img/gcp_iam_sa_principal.png)

### Generate credentials

Go to _IAM > Service Account > Manage key_

![gcp_sa_manage_keys](../../../img/gcp_sa_manage_keys.png)

Then, create a new key (choose the `JSON` format):

![gcp_sa_add_key](../../../img/gcp_sa_add_key.png)

The downloaded file should looks like something like that:

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

Then store the base64 value of this file in the `GCP_APPLICATION_CREDENTIALS` environment variable.

You can use this command in order to generate the base64 value:

```shell
base64 -i projectid.json
```

### Network configuration

Create a `default` network:

![gcp_vpc_network](../../../img/gcp_vpc_network.png)

Here's the terraform code to do it:

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

Then you can store the value `default` in the `GCP_NETWORK` environment variable.

### Firewalls configuration

Here's the terraform code to do it:

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

Then you can add the tags in the `cloud_environments.yml` file:

```yaml
firewall_tags:
  - allow-http
  - allow-https
  - allow-ssh
```
