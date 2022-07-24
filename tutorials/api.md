# Api

## Restful API

There is a Restful API you can directly use here: https://cloud-api.comwork.io

This API is the one that is used by the web console (and the terraform provider to come). It's a Python Flask API that is using the [Scaleway Pulumi package](https://www.pulumi.com/registry/packages/scaleway/) and the tfstate are stored in Scaleway's object storage.

You'll find the Swagger documentation if you click [here](./https://cloud-api.comwork.io)

![swagger](../img/swagger.png)

## Terraform provider

There will be a terraform provider for automating project and instance creation/pause/deletion based on the previous API.

This work is in progress...
