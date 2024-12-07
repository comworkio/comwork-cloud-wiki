# Installation sur kubernetes

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Avec helm

Un helmchart est disponible ici : https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Avec la CLI

Vous pouvez aussi utiliser directement la [CLI](../../cli/README.md) comme ceci :

```shell
$ cwc bootstrap
```

Note: la CLI installera sur le cluster avec lequel vous êtes connectés via le fichier `~/.kube/config`.

Et pour accéder aux services :

```shell
kubectl -n cwcloud port-forward svc/comwork-cloud-api 8000:8000 & kubectl -n cwcloud port-forward svc/comwork-cloud-ui 3000:3000 & disown
```

Vous pourrez ensuite vous connecter via un navigateur sur http://localhost:3000

L'utilisateur par défaut est le suivant :
* User: `sre-devops@comwork.io`
* Password: `cloud456`
