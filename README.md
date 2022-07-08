# Comwork Cloud

Here's the documentation of comwork cloud console and API.

It allows us to provide cloud SaaS services like [code](./code.md) or [wpaas](./wpaas.md) in a "IaC" (infrastructure as code) way: you'll get access to a private [comwork gitlab](https://gitlab.comwork.io) repository that contains ansible roles and playbooks you'll be able to maintain. The modification on this repositories will automatically be applied in your instances.

The instance are hosted on Scaleway for now (but we intend to propose multiple cloud providers in the future).

![cloud_bg](./img/cloud_bg.png)

## Available resources

* [Web console](./web_console.md)
* [Restful api and terraform provider](./api.md)
* [Sizing and pricing](./sizing_pricing.md)
* [VSCode web as a service](./code.md)
* [Portainer as a service](./portainer.md)
* [Wordpress as a service](./wpaas.md)
