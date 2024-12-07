# Configuring OVH

In this section, we'll see how to generate the different API keys with OVH.

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../../translations/fr/tutorials/selfhosted/configuration/ovh.md)

## Configuration

### Constant values

Those values are constants and are not supposed to change:

```shell
OVH_ENDPOINT="ovh-eu"
OS_AUTH_URL="https://auth.cloud.ovh.net/v3/"
```

### Create a public cloud project

Create a project if there's no one existing:

![ovh_public_cloud_project](../img/ovh_public_cloud_project.png)

Copy the project's id's value in the folling variable:

```shell
OVH_SERVICENAME="d89XXXXXXXX"
```

### Create a public cloud user

![ovh_public_cloud_user_1](../img/ovh_public_cloud_user_1.png)

![ovh_public_cloud_user_2](../img/ovh_public_cloud_user_2.png)

Store the username and password in the following environment variables:

```shell
OS_USERNAME="user-5hXXXXXXX9"
OS_PASSWORD="tBXXXXXXXXXXXXXXXXXXXF5"
```

### OpenStack API

You can login in the OpenStack WebUI with the previous credentials: https://horizon.cloud.ovh.net/

![ovh_openstack_gui](../img/ovh_openstack_gui.png)

You can fill the following variable with the red-underlined values (the "_tenant_"):

```shell
OS_TENANT_NAME="48XXXXXXXX38"
```

### CaCloud API

In order to create a token, go there: https://www.ovh.com/auth/api/createToken

Beware on the following details:

* We have to put `*` with all the HTTP methods (GET/PUT/POST/DELETE). Click on `+` if there's one http verb missing one by one.
* _Unlimited_ for the duration

As we can see on the following screenshot:

![ovh_create_token](../img/ovh_create_token.png)

Once it's done, keep the following values:

![ovh_cacloud_api_token](../img/ovh_cacloud_api_token.png)

And write them into those environment variables:

```shell
OVH_APPLICATION_KEY="c3XXXXXXXXXXe"
OVH_APPLICATION_SECRET="e8XXXXXXXXXXX36"
OVH_CONSUMER_KEY="c4XXXXXXXXXX90a"
```

### Create a DNS zone

We simply have to buy a new domain name which will be dynamically managed by CwCloud and that its DNZ zones __must not be managed by another service or process__.

![ovh_dns_zone](../img/ovh_dns_zone.png)

Once we created the first instance which will host CwCloud with a public IP, we'll have to add a DNS `A` record with this public IP, i.e: `cwcloud.xxxxx.com`.

### Golden images with packer and ansible

You'll have to create image that are container git and ansible to accelerate the deployments.

In order to achieve this, follow this repository: https://gitlab.comwork.io/oss/cwc/golden-images-ovh