# Configuring cloudflare

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/configuration/cloudflare.md)

## Configuration

1. Add a new site on cloudflare console:

![cloudflare_add_website](../../../img/cloudflare_add_website.png)

2. Register your domain name with the Free Plan, then copy the DNS servers:

![cloudflare_copy_dns](../../../img/cloudflare_copy_dns.png)

3. Update the DNS server of your domain name, example with OVH:

![update_dns_ovh](../../../img/update_dns_ovh.png)

Replace here the servers `dns12.ovh.net` and `ns12.ovh.net` by the cloudflare's you copied before.

Wait a little bit (it might took 24h), the DNS servers should appears up to date like this:

![updated_dns_server_ovh](../../../img/updated_dns_server_ovh.png)

4. Go create an API token for your selfhosted cwcloud instance:

![cloudflare_api_token_1](../../../img/cloudflare_api_token_1.png)

Then:

![cloudflare_api_token_2](../../../img/cloudflare_api_token_2.png)

Then choose the right template:

![cloudflare_api_token_3](../../../img/cloudflare_api_token_3.png)

Then choose the DNS zone:

![cloudflare_api_token_4](../../../img/cloudflare_api_token_4.png)

Then you can copy/paste the generated token:

![cloudflare_api_token_5](../../../img/cloudflare_api_token_5.png)

You'll have to set the `CLOUDFLARE_API_TOKEN` environment variable with this token.

1. You can add the DNS zone in the `cloud_environments.yml` file:

```yaml
dns_zones:
  - name: pulumi-university.com
    driver: CloudflareDriver
    zone_id: XXXXXXX
```

In order to get the `zone_id`, you can go on cloudflare and copy/past the following value:

![cloudflare_zone_id](../../../img/cloudflare_zone_id.png)
