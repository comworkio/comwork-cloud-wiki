# Installation on kubernetes

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Using Helm

Here, you'll find a helmchart to install it on Kubernetes: https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Using the CLI

You can also directly use the [CLI](../../cli/README.md) (if you need to install it first, go read [this tutorial](../../cli/install.md)) like this:

```shell
cwc bootstrap
```

Note: the CLI will install on the cluster you're already connected via the `~/.kube/config` file.

There's some optional flags available:

Quelques options supplémentaires sont disponibles :

```shell
cwc bootstrap --keepdir # if you want to keep the downloaded helm directory
cwc bootstrap --values my-values.yaml # if you need to override the default helm values
```

If you want to uninstall:

```shell
cwc bootstrap uninstall
```

Then, in order to access to the services (to run in separate shell sessions):

```shell
kubectl -n cwcloud port-forward svc/cwcloud-api 8000:8000
```

```shell
kubectl -n cwcloud port-forward svc/cwcloud-ui 3000:3000
```

You'll be able to open access to the GUI through a web browser using this URL: http://localhost:3000

The default account is:
* User: `sre-devops@comwork.io`
* Password: `cloud456`

You can checkout [this blogpost](https://www.comwork.io/blog/cwcloud-kubernetes-install) which provides more details on how to use it on localhost with Kind.
