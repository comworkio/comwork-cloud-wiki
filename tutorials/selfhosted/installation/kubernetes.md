# Installation on kubernetes

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/installation/kubernetes.md)

## Installation

### Using Helm

Here, you'll find a helmchart to install it on Kubernetes: https://gitlab.comwork.io/oss/cwcloud/cwcloud-helm

### Using the CLI

You can also directly use the [CLI](../../cli/README.md) like this:

If you need to reinstall:

```shell
rm -rf cwcloud
kubectl delete ns cwcloud
```

Then:

```shell
cwc bootstrap
```

Note: the CLI will install on the cluster you're already connected via the `~/.kube/config` file.

Then, in order to access to the services (to run in separate shell sessions):

```shell
kubectl -n cwcloud port-forward svc/comwork-cloud-api 8000:8000
```

```shell
kubectl -n cwcloud port-forward svc/comwork-cloud-ui 3000:3000
```

You'll be able to open access to the GUI through a web browser using this URL: http://localhost:3000

The default account is:
* User: `sre-devops@comwork.io`
* Password: `cloud456`
