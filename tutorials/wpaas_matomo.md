# Wordpress and matomo

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](./translations/fr/wpaas_matomo.md)

## Video tutorial

Here you'll find a demo on how deploying [WPaaS](../wpaas.md)[^1] and [matomo](../matomo.md) instances and order to analyze SEO insights:

[![demo_wordpress_matomo](../img/demo_wordpress_matomo.png)](https://youtu.be/klVgXyELu10)

You can activate the subtitles in English or French to get more details on this demo. 

Enjoy!

[^1]: wordpress as a service

## Init your wordpress instance

Once your instance is up, you can click on the `open` link here:

![instance_open_link](../img/instance_open_link.png)

It'll ask for a username and password and it's the following:

* username: `admin`
* password: `changeit`

You can change your password in the `env/{env_name}.yml` file:

```yaml
wp_admin_users:
  - name: admin
    passwd: $apr1$M4x65b92$KsQCdoC.BzdBcuTai2MuG0
```

For generating a new password to copy in the `passwd` field:

```shell
htpasswd -c .htpasswd.tmp admin
cat .htpasswd.tmp | cut -d ":" -f2 # copy the output as passwd
rm -rf .htpasswd.tmp
```

## Migrate an existing Wordpress to cwcloud WPaaS

### On the old instance to move

1. Create a bucket on cwcloud and keep the endpoint, region, access key and secret key.

If you're in the SaaS version, ask for [object storage access](../storage.md).

You'll find the credentials here:

![wpaas-bucket](../img/wpaas-bucket.png)

2. Search, install and activate the "All in one migration" plugin:

![wpaas-all-in-one-plugin](../img/wpaas-all-in-one-plugin.png)

3. Upload, install and activate the following extensions:

* `all-in-one-wp-migration-unlimited-extension.zip`
* `all-in-one-wp-migration-s3-client-extension.zip`

This way:

![wpaas-all-in-one-exts](../img/wpaas-all-in-one-exts.png)

Those two extensions have to be purchased [here](https://servmask.com/).

If you're in a development contract with [comwork.io](https://www.comwork.io), we have the ability to use our own purchased one with our customers.

Upgrade those plugins if necessary:

![wpaas-upgrade-ext](../img/wpaas-upgrade-ext.png)

4. Setup the S3/object storage bucket we'll use for the dump:

![wpaas-s3-settings](../img/wpaas-s3-settings.png)

5. Run the export:

![wpaas-s3-export](../img/wpaas-s3-export.png)

### On the new instance

On the new instance you just created: 

1. Install the same plugins and extensions

2. Configure the same object/storage bucket

3. Run the import:

![wpaas-s3-import](../img/wpaas-s3-import.png)

4. Choose the most recent backup:

![wpaas-s3-choose-backup](../img/wpaas-s3-choose-backup.png)

5. Configure the daily backup:

![wpaas-daily-backup](../img/wpaas-daily-backup.png)

### Re-init a corrupted wordpress instance

You have to be sure that there is backups on the object storage.

Then, go on the instance with SSH or portainer and remove the containers and volumes:

```shell
docker rm -f wp_app wp_db
docker volume rm root_db_data root_wordpress_data
```

Then, redeploy with the gitlab-ci pipeline which will run the ansible playbook.

Then, restore the most recent backup using the previous procedure.

## Use the comwork cloud Email API

You can see [this tutorial](./emailapi.md).
