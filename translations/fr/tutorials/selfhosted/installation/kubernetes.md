# Installation sur kubernetes

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Avec helm

Un helmchart est disponible ici : https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Avec la CLI

Vous pouvez aussi utiliser directement la [CLI](../../cli/README.md) comme ceci :

Si vous souhaitez ré-installer :

```shell
rm -rf cwcloud
kubectl delete ns cwcloud
```

Puis :

```shell
cwc bootstrap
```

Note: la CLI installera sur le cluster avec lequel vous êtes connectés via le fichier `~/.kube/config`.

Et pour accéder aux services (à lancer dans des terminaux séparés) :

```shell
kubectl -n cwcloud port-forward svc/comwork-cloud-api 8000:8000
kubectl -n cwcloud port-forward svc/comwork-cloud-ui 3000:3000
```

Vous pourrez ensuite vous connecter via un navigateur sur http://localhost:3000

L'utilisateur par défaut est le suivant :
* User: `sre-devops@comwork.io`
* Password: `cloud456`
