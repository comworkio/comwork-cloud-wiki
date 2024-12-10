# Installation on kubernetes

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Using Helm

Here, you'll find a helmchart to install it on Kubernetes: https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

* The field `db.password` is optional, it's creating a `${releaseName}-cwcloud-chart-db-env-secret` with the `POSTGRES_PASSWORD` key. If you want to use something like [vault](https://www.vaultproject.io) or [sealedsecret](https://github.com/bitnami-labs/sealed-secrets), you have to create a secret with this name and containing this key.
* If you prefer to use an external database, you can set the flag `db.enabled` to `false`.
* In order to enable ingress for the api you have to set the flag `api.ingress.enabled` to `true`.
* In order to enable ingress for the ui you have to set the flag `ui.ingress.enabled` to `true`.
* If you want to enable opentelemetry with the API, you have to set the flag `otel.enabled` to `true` and replace the endpoint with `otel.endpoint`.

### Using the CLI

You can also directly use the [CLI](../../cli/README.md) (if you need to install it first, go read [this tutorial](../../cli/install.md)) like this:

```shell
cwc bootstrap
```

Note: the CLI will install on the cluster you're already connected via the `~/.kube/config` file.

There's some optional flags available:

Quelques options supplémentaires sont disponibles :

```shell
cwc boostrap --openshift # if you're installing on openshift
cwc bootstrap --keepdir # if you want to keep the downloaded helm directory
cwc bootstrap --values my-values.yaml # if you need to override the default helm values
cwc bootstrap --namespace cwc # if you want to change the namespace
cwc bootstrap --recreate-ns # if you want to delete and recreate the namespace
cwc bootstrap --recreate-ns --openshift # if you want to use oc instead of kubectl
```

If you want to uninstall:

```shell
cwc bootstrap uninstall
cwc bootstrap uninstall --force # force delete all resources like pods, deployments...
cwc bootstrap uninstall --force --openshift # if you want to use oc instead of kubectl
```

Then, in order to access to the services:

```shell
cwc bootstrap pfw
cwc bootstrap pfw --openshift # if you want to use oc instead of kubectl
```

You'll be able to open access to the GUI through a web browser using this URL: http://localhost:3000

The default account is:
* User: `sre-devops@comwork.io`
* Password: `cloud456`

You can checkout [this blogpost](https://www.comwork.io/blog/cwcloud-kubernetes-install) which provides more details on how to use it on localhost with Kind.
