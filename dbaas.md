# Database as a service

We offer some low-cost database as a service you can manage as usual in a gitops way

![pgsql_instance](./img/pgsql_instance.png)

## Disclaimer

We do not handle the backup or point in time recovery for now but it's something that can be easily handle with ansible roles which dump and push backups on object storage.

We will public some opensource role you can re-use to handle this part with tutorials.

Of course, managed services from Scaleway or OVH but a lot more expensive. You can start your test on our services than upgrade to the dbaas from those cloud providers.

## Supported databases

* PostgreSQL
* MariaDB (MySQL)

## Demo and tutorial

You can find demo and tutorials [here](./tutorials/dbaas.md)

## Minimal requirements

We advise to start with an instance >= [DEV1-S](./sizing_pricing.md)

## Sizing and pricing

Check it out [here](./sizing_pricing.md).
