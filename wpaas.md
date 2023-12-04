# Wordpress as a service

A secured and dedicated Wordpress instance a service.

Yet another "Wordpress as a Service" (WPaaS) with some benefits :

* It can be hosted in __Europe__ 🇪🇺 (including __France__ 🇫🇷) with French providers (like Scaleway or OVH)
* You choose the sizing of your instance as you'll pick your own VPS
* Rolling upgrades of Wordpress / PHP / MySQL
* __Very strong security__: https/TLS encryption, firewalling, DDoS protection and wp-admin double authentication
* SEO insights with your __Matomo__ instance (see [here](./matomo.md))

Especially, this WPaaS is the right for you if you want to deploy and manage your reverse proxy and certificate like a real ops who work with ansible in a gitops way ;-p

Want a meeting or a quote ? [Contact us](./subscription.md)

![sidiamor](./img/sidiamor.png)

_One of our most valuable partner, the [GDA Sidi Amor](https://sidiamor.org) which was struggling with multiple low cost shared hosting with lots of down time, TLS certificates, very old versions of PHP or MySQL and no security and backups. They almost lost everything!_

## Demo and tutorial

You can find demo and tutorials [here](./tutorials/wpaas_matomo.md)

## Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

## Sizing and pricing

Check it out [here](./sizing_pricing.md).

You can also choose to do it by yourself, it's completely free, enjoy [our repository](https://gitlab.comwork.io/oss/ansible-iac/ansible-wordpress) with the docker image and ansible role in order to install it by yourself.
