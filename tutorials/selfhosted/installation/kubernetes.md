# Installation on kubernetes

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Using Helm

Here, you'll find a helmchart to install it on Kubernetes: https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Using the CLI

You can also directly use the [CLI](./cli/README.md) like this:

```shell
$ cwc bootstrap
```

Note: the CLI will install on the cluster you're already connected via the `~/.kube/config` file.

Then, in order to access to the services:

```shell
kubectl -n cwcloud port-forward svc/comwork-cloud-api 8000:8000
kubectl -n cwcloud port-forward svc/comwork-cloud-ui 3000:3000
```
