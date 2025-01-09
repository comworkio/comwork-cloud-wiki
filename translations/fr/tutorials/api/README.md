# Api

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/api/README.md)

## Webservices REST

Il existe une API Restful que vous pouvez directement utiliser ici: https://api.cwcloud.tech

Cette API est celle qui est utilisée par la [console web](../console/README.md), la ligne de commande [`cwc`](../cli/README.md) (et dans le futur, le provider terraform). Il s'agit d'une API développée en Python FastAPI qui utilise les paquets Pulumi de [Scaleway](https://www.pulumi.com/registry/packages/scaleway/) et [OpenStack](https://www.pulumi.com/registry/packages/openstack/). L'état (fichiers `.tfstate`) pulumi sont persistés dans l'object storage de Scaleway.

Vous trouverez la documentation des webservices [ici](https://api.cwcloud.tech) et comment vous authentifier à cette API [ici](./api_credentials.md).

![swagger](../../../../img/swagger.png)

## Ligne de commande `cwc`

Nous mettons également à disposition notre propre ligne de commande `cwc` écrite en go.

Pour en savoir plus [cliquez ici](../cli/README.md)

## Terraform provider

_Ce travail est en cours..._
