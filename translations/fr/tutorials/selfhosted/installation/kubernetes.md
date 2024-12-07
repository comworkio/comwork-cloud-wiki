# Installation sur kubernetes

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Avec helm

Un helmchart est disponible ici : https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Avec la CLI

Vous pouvez aussi utiliser directement la [CLI](../../cli/README.md) (pour l'installer c'est [par ici](../../cli/install.md)) comme ceci :

```shell
cwc bootstrap
```

Note: la CLI installera sur le cluster avec lequel vous êtes connectés via le fichier `~/.kube/config`.

Quelques options supplémentaires sont disponibles :

```shell
cwc bootstrap --keepdir # si vous souhaitez garder le dossier helm téléchargé sans l'écraser
cwc bootstrap --values my-values.yaml # si vous souhaitez surcharger les valeurs passés au helmchart
```

Pour désinstaller :

```shell
cwc bootstrap uninstall
```

Et pour accéder aux services (à lancer dans des terminaux séparés) :

```shell
kubectl -n cwcloud port-forward svc/cwcloud-api 8000:8000
```

```shell
kubectl -n cwcloud port-forward svc/cwcloud-ui 3000:3000
```

Vous pourrez ensuite vous connecter via un navigateur sur http://localhost:3000

L'utilisateur par défaut est le suivant :
* User: `sre-devops@comwork.io`
* Password: `cloud456`

Vous pouvez consulter [ce blogpost](https://www.comwork.io/blog/cwcloud-kubernetes-install) qui fournit plus de détails sur comment l'utiliser avec Kind.
