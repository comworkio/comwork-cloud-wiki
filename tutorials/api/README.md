# Api

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/api/README.md)

## Restful API

There is a Restful API you can directly use here: https://cloud-api.comwork.io

This API is the one that is used by the [web console](../console/README.md), the CLI [`cwc`](../cli/README.md) (and the terraform provider to come). It's a Python FastAPI that is using the [Scaleway](https://www.pulumi.com/registry/packages/scaleway/) or the [OpenStack](https://www.pulumi.com/registry/packages/openstack/) pulumi packages and the tfstate are stored in Scaleway's object storage.

You'll find the endpoints documentation [here](./restful_api.md) and how to authenticate this api [here](./api_credentials.md).

Or you can either go check directly the swagger documentation [here](https://cloud-api.comwork.io).

![swagger](../../img/swagger.png)

## Cli `cwc`

We got our own cli `cwc` written in go.

Check-it out [here](../cli/README.md)

## Terraform provider

_This work is in progress..._
