# Email API

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](./translations/fr/emailapi.md)

## Enabling this API

In the SaaS version, you can ask to be granted using the [support system](./console/public/support.md).

If you're admin of the instance, you can grant users like this:

![emailapi_enable](../img/emailapi_enable.png)

## UI form

Once you're enabled, you can try to send emails using this web UI:

![emailapi_form](../img/emailapi_form.png)

## CMS plugins

### Wordpress

You can use this [plugin](https://gitlab.comwork.io/oss/cwc/cwcloud-wordpress-email):

**1/** Download the right zip extension file (either the `-io` if you're using cloud.comwork.io instance of `-tn` if you're using the cwcloud.tn instance)

![wpaas_email_ext1](../img/wpaas_email_ext1.png)

**2/** Configure the extension:

Generate API credentials. You can see [this tutorial](./api/api_credentials.md)

And copy paste the secret key here:

![wpaas_email_ext2](../img/wpaas_email_ext2.png)
