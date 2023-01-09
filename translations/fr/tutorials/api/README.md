# Api

## API Restful

Il existe une API Restful que vous pouvez directement utiliser ici: https://cloud-api.comwork.io

Cette API est celle qui est utilisée par la [console web](../console/README.md), la cli [`cwc`](../cli/README.md) (et dans le futur, le provider terraform). It's a Python Flask API that is using the [Scaleway](https://www.pulumi.com/registry/packages/scaleway/) or the [OpenStack](https://www.pulumi.com/registry/packages/openstack/) pulumi packages and the tfstate are stored in Scaleway's object storage.

You'll find the endpoints documentation [here](../../../../tutorials/api/restful_api.md).

Or you can either go check directly the swagger documentation [here](https://cloud-api.comwork.io).

![swagger](../../../../img/swagger.png)

## Cli cwc

We got our own cli `cwc` written in go.

Check-it out [here](../cli/README.md)

## Terraform provider

_This work is in progress..._
