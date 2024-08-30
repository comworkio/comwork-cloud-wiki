# Deployment as a Service

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/daas.md)

## Definition

_DaaS_ for _Deployment as a service_ is a compromise between the _IaaS[^1]_ and the _PaaS[^2]_. You have the ability:
* to provision ready-to-use managed services from a modern web-console (_PaaS_)
* to update your deployments scripts and template[^3] (_IaaS_ operated with _IaC[^4]_ in a _gitops_ way)
* to orchestrate those deployments through an API and CLI alongside other common cloud components such as OCI registries, object storages... (_IaaS_)

If we had to summarize what are the main difference between IaaS, PaaS, serverless and finally DaaS, here's what we'd say:

* _IaaS_: you own the infrastructure, the cloud provides you with water, gas and power (ram, cpu, storage...), you are only billed for your consumption of this infrastructure and responsible for building your system on top of it
* _PaaS_ or serverless (_CaaS[^5]_, _FaaS[^6]_ and _DBaaS[^7]_): the cloud provides you with managed services, you aren't responsible on how they work and are billed on your use of those services
* _DaaS_ is like _IaaS_: you are billed on your infrastructure consumption and owned it and are responsible for it but you have a speed and already implemented automation for the deployment which give you a very similar experience of the _PaaS_

[^1]: _Infrastructure as a service_
[^2]: _Platform as a service_
[^3]: ansible roles and playbooks for VM, helm charts for Kubernetes
[^4]: _Infrastructure as code_
[^5]: _Containers as a service_
[^6]: _Functions as a service_
[^7]: _Databases as a service_

## How it works

Here's a schema explaining how the DaaS is working using virtual machines:

![cwcloud_daas_vm](../img/cwcloud_daas_vm.png)

And how it's working with Kubernetes:

![cwcloud_daas_k8s](../img/cwcloud_daas_k8s.png)

You can also check-out this [DevoxxFR](https://www.devoxx.fr)'s university we gave to explain how the DaaS of cwcloud is working:

[![devoxxfr_pulumi_university](../img/devoxxfr_pulumi_university.png)](https://youtu.be/IAwu-WCN6Nw?si=4w0zY5ri6JC_h8-A)

## Examples

You'll find various examples and demo in this playlist:

[![demo_playlist](../img/demo_1.png)](https://youtube.com/playlist?list=PLVa_2sL_l0msxUnmaSpLAGlwOxizXWjht)
