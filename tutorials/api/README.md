# Api

## Restful API

There is a Restful API you can directly use here: https://cloud-api.comwork.io

This API is the one that is used by the web console (and the terraform provider to come). It's a Python Flask API that is using the [Scaleway](https://www.pulumi.com/registry/packages/scaleway/) or the [OpenStack](https://www.pulumi.com/registry/packages/openstack/) pulumi packages and the tfstate are stored in Scaleway's object storage.

You'll find the endpoints documentation [here](./restful_api.md).

Or you can either go check directly the swagger documentation [here](https://cloud-api.comwork.io).

![swagger](../../img/swagger.png)

## Terraform provider

Check-it out [here](./terraform.md)
