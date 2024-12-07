# Configurer cloudflare

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/configuration/cloudflare.md)

## Configuration

1. Ajouter un nouveau site avec cloudflare:

![cloudflare_add_website](../../../../../img/cloudflare_add_website.png)

1. Enregistrer votre nom de domaine avec le Free Plan, puis copier les DNS:

![cloudflare_copy_dns](../../../../../img/cloudflare_copy_dns.png)

3. Mettre à jour les serveur DNS, exemple avec OVH:

![update_dns_ovh](../../../../../img/update_dns_ovh.png)

Remplacer ici les serveurs `dns12.ovh.net` et `ns12.ovh.net` par ceux de cloudflare que vous avez copié juste avant.

Attendre un peu (jusqu'à 24h), les serveurs DNS devraient apparaitre à jour comme ceci:

![updated_dns_server_ovh](../../../../../img/updated_dns_server_ovh.png)

4. Créer un token d'API pour votre instance cwcloud :

![cloudflare_api_token_1](../../../../../img/cloudflare_api_token_1.png)

ensuite:

![cloudflare_api_token_2](../../../../../img/cloudflare_api_token_2.png)

Ensuite choisir le bon template :

![cloudflare_api_token_3](../../../../../img/cloudflare_api_token_3.png)

Ensuite choisir la zone DNS :

![cloudflare_api_token_4](../../../../../img/cloudflare_api_token_4.png)

Copier/coller le token généré :

![cloudflare_api_token_5](../../../../../img/cloudflare_api_token_5.png)

Vous devez setter la variable d'environnement `CLOUDFLARE_API_TOKEN` avec ce token.

5. Vous pouvez ensuite ajouter votre nouvelle zone DNS dans le fichier `cloud_environments.yml` :

```yaml
dns_zones:
  - name: pulumi-university.com
    driver: CloudflareDriver
    zone_id: XXXXXXX
```

Pour récupérer la `zone_id`, copier la valeur suivante depuis cloudflare :

![cloudflare_zone_id](../../../../../img/cloudflare_zone_id.png)
