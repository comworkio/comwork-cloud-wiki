# Comwork Cloud

Here's the documentation of [comwork cloud console](https://cloud.comwork.io) and [API](https://cloud-api.comwork.io).

"CwCloud" (for _Comwork Cloud_) is a platform that allows us to accelerate the infrastructure provisioning and managed service such as [serverless FaaS engine](./serverless.md), [Advanced web IDE](./code.md), [WPaaS[^1]](./wpaas.md) or any other application you want to deploy as a managed service.

It aims to provide those services in a "_IaC_[^2]" or "_GitOps_" way: you'll get access to gitlab repositories that contains ansible roles, templates and playbooks you'll be able to maintain (same thing with Helm for Kubernetes instances very soon). The modification on this repositories will automatically be applied in your instances.

There is a SaaS version which provide instances that are hosted on [Scaleway](https://www.scaleway.com) or [OVHCloud](https://www.ovhcloud.com). Those two are really beautiful European 🇪🇺 cloud providers and we intend to propose even more cloud providers in the future (CwCloud can work with any cloud provider that provide standard IaaS API's such as OpenStack or Kubernetes in the very near future).

There is also a way to deploy CwCloud [on premises](./tutorials/onprem.md) with your own prefered cloud provider and account.

![cloud_bg](./img/cloud_bg.png)

[^1]: _wordpress as a service_
[^2]: _infrastructure as code_

## Links

* The documentation is available here: https://doc.cloud.comwork.io
* The markdown sources that are used to generate the documentation are availables here: https://gitlab.comwork.io/comwork_public/comwork_cloud

## Available resources

### Documentations

* [VSCode web as a service](./code.md)
* [Serverless / FaaS](./serverless.md)
* [Localtunnel server](./localtunnel.md)
* [Portainer as a service](./portainer.md)
* [Wordpress as a service](./wpaas.md)
* [Matomo as a service](./matomo.md)
* [Mastodon as a service](./mastodon.md)
* [odoo as a service](./odoo.md)
* [Databases as a service](./dbaas.md)
* [Gateway as a service](./vps.md)
* [Object storages and OCI registries](./storage.md)
* [Sizing and pricing](./sizing_pricing.md)
* [Subscription procedure](./subscription.md)
* [Terms of service](./terms.md)
* [Community and support](./community.md)
* [Licences](./licences.md)
* [Cloud on premises / selfhosted](./onprem.md)

### Tutorials and demos

Go see all our available tutorials and demo [here](./tutorials/README.md)

## On premise version

You're already hosted on [Scaleway](https://www.scaleway.com) or [OVHCloud](https://www.ovhcloud.com) or any other cloud provider based on Openstack API, you can have your own self-hosted/onprem instance.

You can [contact us](./subscription.md) if this is something you're interested in.