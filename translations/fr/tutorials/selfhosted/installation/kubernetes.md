# Installation sur kubernetes

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Avec helm

Un helmchart est disponible ici : https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

* Le champ `db.password` est optionnel, le renseigner va créer un secret `${releaseName}-cwcloud-chart-db-env-secret` avec comme clef `POSTGRES_PASSWORD`. Vous pouvez utiliser des systèmes comme [vault](https://www.vaultproject.io) ou [sealedsecret](https://github.com/bitnami-labs/sealed-secrets) à la place, vous devrez tout simplement créer un secret avec le même nom et cette clef.
* Si vous préférez utiliser une base de donnée externe, vous pouvez mettre la valeur de `db.enabled` à `false`.
* Si vous voulez activer l'ingress pour l'API, vous devez mettre la valeur de `api.ingress.enabled` à `true`.
* Si vous voulez activer l'ingress pour la GUI, vous devez mettre la valeur de `ui.ingress.enabled` à `true`.
* Si vous voulez activer opentelemetry avec l'API, vous devez mettre la valeur de `otel.enabled` à `true` et remplacer la valeur de l'endpoint avec `otel.endpoint`.

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
cwc boostrap --namespace cwc # si vous souhaitez installer sur un autre namespace
cwc bootstrap --recreate-ns # si vous voulez écraser le namespace et le recréer
cwc bootstrap --recreate-ns --openshift # si vous souhaitez utiliser oc à la place de kubectl
```

Pour désinstaller :

```shell
cwc bootstrap uninstall
cwc bootstrap uninstall --force # force la suppression de toutes les resources sur le namespace (pods, deployments, etc)
cwc bootstrap uninstall --force --openshift # si vous souhaitez utiliser oc à la place de kubectl
```

Et pour accéder aux services :

```shell
cwc bootstrap pfw
cwc bootstrap pfw --openshift # si vous souhaitez utiliser oc à la place de kubectl
```

Vous pourrez ensuite vous connecter via un navigateur sur http://localhost:3000

L'utilisateur par défaut est le suivant :
* User: `sre-devops@comwork.io`
* Password: `cloud456`

Vous pouvez consulter [ce blogpost](https://www.comwork.io/blog/cwcloud-kubernetes-install) qui fournit plus de détails sur comment l'utiliser avec Kind.
