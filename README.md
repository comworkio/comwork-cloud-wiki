# Comwork Cloud

Here's the documentation of comwork cloud console and API.

It allows to provide cloud SaaS services like [code](./code.md) or [wpaas](./wpaas.md) in a "IaC" (infrastructure as code) way: you'll get access to a private [comwork gitlab](https://gitlab.comwork.io) repository that contains ansible roles and playbooks you'll be able to maintain. The modification on this repositories will automatically be applied in your instances.

The instance are hosted on Scaleway for now (but we intend to propose multiple cloud providers in the future).

## Table of content

[[_TOC_]]

## SaaS services available

* [code](./code.md)
* [Wordpress as a service](./wpaas.md)
## Sizing and pricing

Check it out [here](./sizing_pricing.md).

## Console

### Public console

The console is here: https://cloud.comwork.io

First you can register and ask to the comwork team to enable your account with a conf meeting you can setup [here](https://calendly.com/idriss-neumann/intro-comwork-cloud).

Then you'll be able to create your gitlab projects:

![project](./img/project.png)

Then your instances:

![create_instance](./img/create_instance.png)

![created_instance](./img/create_instance.png)

After creating your instance, you'll be able manage it from the web console:

![instance](./img/instance.png)

### Administrators

You can manage the environments which are a set of ansible roles and templates.

![environments](./img/environments.png)

Keeping environment private will make the environment not accessible for non-admin users.

![create_environment](./img/create_environment.png)

## Api

There is a Restful API you can directly use here: https://cloud-api.comwork.io

This API is the one that is used by the web console (and the terraform provider to come). It's a Python Flask API that is using the [Scaleway Pulumi package](https://www.pulumi.com/registry/packages/scaleway/) and the tfstate are stored in Scaleway's object storage.

You'll find the Swagger documentation if you click on the previous link.

![swagger](./img/swagger.png)

## Terraform provider

There will be a terraform provider for automating project and instance creation/pause/deletion based on the previous API.

This work is in progress...
