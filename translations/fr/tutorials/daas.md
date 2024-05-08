# Deployment as a Service

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/daas.md)

## Définition

_DaaS_ for _Deployment as a service_ est un compromis entre l'_IaaS_ et le _PaaS_. Vous avez à la fois la possibilité :
* de provisionner des services managés prêts à l'emploi depuis une console web moderne (_PaaS_)
* de mettre à jour vos templates et scripts de déploiements[^3] de façon "gitops" (_IaaS_)
* d'orchestrer ces déploiements à partir d'une API ou CLI incluant d'autres composants communs du cloud tels que les registries OCI, les objects storages... (_IaaS_)

[^1]: _Infrastructure as a service_
[^2]: _Platform as a service_
[^3]: roles et playbooks ansible pour les VM, helm charts pour Kubernetes

## Comment ça fonctionne

Voici un schéma expliquant comment le DaaS fonctionne avec des machines virtuelles :

![cwcloud_daas_vm](../../../img/cwcloud_daas_vm.png)

Et un autre expliquant comment ça fonctionne avec Kubernetes :

![cwcloud_daas_k8s](../../../img/cwcloud_daas_k8s.png)

Vous pouvez aussi consulter cette université que nous avons donné à [DevoxxFR](https://www.devoxx.fr) qui explique comment le DaaS fonctionne avec cwcloud en détail :

[![devoxxfr_pulumi_university](../../../img/devoxxfr_pulumi_university.png)](https://youtu.be/IAwu-WCN6Nw?si=4w0zY5ri6JC_h8-A)

## Exemples

Vous trouverez de nombreux exemples qui illustrent cette définition dans cette playliste de démos :

[![demo_playlist](../../../img/demo_1.png)](https://youtube.com/playlist?list=PLVa_2sL_l0msxUnmaSpLAGlwOxizXWjht)
