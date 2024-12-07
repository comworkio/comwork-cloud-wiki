# Self-hosted CwCloud



## Configure CwCloud with AWS

In this section, we'll see how to generate access and secret keys with AWS. Then we will see how to get the subnet ID for each availability zone (a, b, c,...), the security group ID as well as the DNS hosted zone ID.

### Choose a region

On the right of the Console Home page, you can find a list of all activated regions in your account. Choose the closest region to where you're working:

You can write the region value in this environment variable:

```shell
AWS_STRATEGY_DEFAULT_REGION="xx-xxxx-x"
```

![aws_1](../img/aws_regions5.png)

### Create a user

We first have to create a user from which we generate access and secret keys. Search for IAM:

![aws_1](../img/aws_1.png)

Select Users: 

![aws_2](../img/aws_users.png)

![aws_2](../img/aws_adduser.png)

You will have a three step process to create the user:

1. Write user's name.

2. Set his permissions.

![aws_4](../img/aws_4.png)

3. Then create.

![aws_rcreate_user](../img/aws_rcreate_user.png)

### Create access and secret keys

Select the created user then:

![aws_access](../img/aws_access.png)

We go down in the user page:

![aws_5](../img/aws_5.png)

Choose the Command Line Interface option, then write a description (optional). Finally, create the key.

![aws_6](../img/aws_6.png)

Then you can get the your access and secret key as well as the default region so that you can write them into those environment variables:

```shell
AWS_STRATEGY_ACCESS_KEY_ID="AKIxxxxxxxxxxxxxxxxx"
AWS_STRATEGY_SECRET_ACCESS_KEY="qvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

![aws_7](../img/aws_7.png)

### Get subnet ID

Search for VPC:

![aws_8](../img/aws_8_vpc.png)

Seleck the VPC you want to work with:

![aws_sebnet1](../img/aws_subnets.png)

Select the wanted VPC. You can find the subnet ID for each availability zone (a, b, c, etc.)

![aws_subnet2](../img/aws_vpc_hierarchy.png)

You choose the subnet IDs accordingly to each availability zone. You can write the subnet ID in the cloud environments yaml file: 

```shell
zones:
  - name: "availability_zone"
    subnet: subnet-048XXXXXXXXXXXXXX
```

### Get security group ID

In the left side-bar, choose Security Groups: 

![aws_sg1](../img/aws_sg1.png)

You choose the subnet IDs accordingly to each region and availability zone(a, b, c). You can write the security group ID in the cloud environments yaml file: 

```shell
zones:
  - name: "availability_zone"
    subnet: sg-026XXXXXXXXXXXXXX
    sg: sg-0266XXXXXXXXXXXXX
```

![aws_9_sg_list2](../img/aws_9_sg_list2.png)

### Get the DNS hosted zone ID

Search for Route53:

![aws_route53_1](../img/aws_route53_1.png)

You should buy a Domain so that you can get a Hosted Zone automatically.

![aws_route53_1](../img/aws_route53_2.png)

You can write the hosted zone ID in the cloud environments yaml file:

```shell
dns_hosted_zone_id: Z08XXXXXXXXXXXXXXXXB
```

![aws_route53_1](../img/aws_route53_3.png)

## Configure CwCloud with GCP

### Get the project ID

Copy/paste the following value in the `GCP_PROJECT_ID` environment variable:

![gcp_project_id](../img/gcp_project_id.png)

### Generate service account

Create a service account `cwcloud`

Then, grant it the access `owner`:

![gcp_sa_access_1](../img/gcp_sa_access_1.png)

![gcp_sa_access_2](../img/gcp_sa_access_2.png)

The service account has also to appear in the principals account:

![gcp_iam_sa_principal](../img/gcp_iam_sa_principal.png)

### Generate credentials

Go to _IAM > Service Account > Manage key_

![gcp_sa_manage_keys](../img/gcp_sa_manage_keys.png)

Then, create a new key (choose the `JSON` format):

![gcp_sa_add_key](../img/gcp_sa_add_key.png)

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

![gcp_vpc_network](../img/gcp_vpc_network.png)

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

## Configure DNS zone with cloudflare

1. Add a new site on cloudflare console:

![cloudflare_add_website](../img/cloudflare_add_website.png)

2. Register your domain name with the Free Plan, then copy the DNS servers:

![cloudflare_copy_dns](../img/cloudflare_copy_dns.png)

3. Update the DNS server of your domain name, example with OVH:

![update_dns_ovh](../img/update_dns_ovh.png)

Replace here the servers `dns12.ovh.net` and `ns12.ovh.net` by the cloudflare's you copied before.

Wait a little bit (it might took 24h), the DNS servers should appears up to date like this:

![updated_dns_server_ovh](../img/updated_dns_server_ovh.png)

4. Go create an API token for your selfhosted cwcloud instance:

![cloudflare_api_token_1](../img/cloudflare_api_token_1.png)

Then:

![cloudflare_api_token_2](../img/cloudflare_api_token_2.png)

Then choose the right template:

![cloudflare_api_token_3](../img/cloudflare_api_token_3.png)

Then choose the DNS zone:

![cloudflare_api_token_4](../img/cloudflare_api_token_4.png)

Then you can copy/paste the generated token:

![cloudflare_api_token_5](../img/cloudflare_api_token_5.png)

You'll have to set the `CLOUDFLARE_API_TOKEN` environment variable with this token.

1. You can add the DNS zone in the `cloud_environments.yml` file:

```yaml
dns_zones:
  - name: pulumi-university.com
    driver: CloudflareDriver
    zone_id: XXXXXXX
```

In order to get the `zone_id`, you can go on cloudflare and copy/past the following value:

![cloudflare_zone_id](../img/cloudflare_zone_id.png)

## Observability

Cwcloud-api is providing a `/metrics` http endpoint that can be scrapped by Prometheus:

![prometheus](../img/prometheus.png)

And you can also send the metrics, logs and some traces through OTLP/Grpc (configured with the `OTEL_COLLECTOR_ENDPOINT` environment variable).

Here's example of traces with Jaegger:

![jaegger](../img/jaegger.png)

## Console tutorials

You might use the console as an administrator if you're getting your own on premises instance.

You'll find all the tutorials you need for administrating the console [here](./console/admin/README.md)
