# Quickwit as a service

[Quickwit](https://www.quickwit.io) is a modern observability solution compliant with Grafana, Jaegger and OpenTelemetry.

For now it handles logs and traces with an efficiant search engine written in Rust (comparable to Apache Lucene used by Elasticsearch and Apache SolR) and it's able to store the data on object storage in order to lower the price.

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/quickwit.md)

## Installation and tests

Choose the Quickwit environment:

![quickwit_environment](../img/quickwit_environment.png)

Once the installation is finished, test the access to Quickwit's GUI with this URL: `https://{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`. The default credentials are:

* Username: `quickwit`
* Password: `changeit`

![quickwit_gui](../img/quickwit_gui.png)

Then test with the same credentials, the Grafana's access with this URL: `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

![grafana_first_login](../img/grafana_first_login.png)

The default grafana credentials are:
* Username: `admin`
* Password: `admin`

Then, you'll be asked to change-it, don't forget to remember-it somewhere safe!

## DNS issue with Grafana

If you have some issue to connect with grafana:
* Connect [with ssh](./ssh.md)
* Check if you have DNS issues in the logs of the grafana container:

```shell
$ docker logs grafana -f
Error: ✗ failed to download plugin archive: Get "https://github.com/quickwit-oss/quickwit-datasource/releases/download/v0.4.5/quickwit-quickwit-datasource-0.4.5.zip": dial tcp: lookup github.com on 127.0.0.11:53: read udp 127.0.0.1:43845->127.0.0.11:53: i/o timeout
```

* In this case, enable docker iptables by disabling this flag in the `env/{env_name}.yml` file:

```yaml
docker_disable_iptables: false
```

* Then push and wait until Grafana's back. Then revert your previous change

## Update your password

You can change your password in the `env/{env_name}.yml` file:

```yaml
gw_auth_files:
  - name: qw.keys
    users:
      - name: quickwit
        passwd: $apr1$M4x65b92$KsQCdoC.BzdBcuTai2MuG0
```

For generating a new password to copy in the `passwd` field:

```shell
htpasswd -c .htpasswd.tmp quickwit
cat .htpasswd.tmp | cut -d ":" -f2 # copy the output as passwd
rm -rf .htpasswd.tmp
```

## Change storage to object storage

Ask for storage, see [this page](../storage.md) to get more informations.

Let's suppose you have this bucket created:

![cwcloud_quickwit_bucket](../img/cwcloud_quickwit_bucket.png)

With this endpoint on Scaleway: `https://qw-indexes-wmb0pz.s3.fr-par.scw.cloud`

Fill this variables in the `env/{env_name}.yml` file:

```yaml
quickwit_bucket_access_key_id: access_key_id_value
quickwit_bucket_secret_key: secret_key_id_value
quickwit_bucket_region: fr-par
quickwit_bucket_name: qw-indexes-wmb0pz
quickwit_bucket_endpoint: https://s3.fr-par.scw.cloud
```

Replace `access_key_id_value` and `secret_key_id_value` with credentials you'll have generated in your _IAM_ (_Identity Access Management_).

Go back on Quickwit and check if the changes are applied in the node configuration:

![quickwit_storage_settings](../img/quickwit_storage_settings.png)

## Grafana datasource for logs

Go back to Grafana: `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Add a new connection:

![grafana_add_new_connection](../img/grafana_add_new_connection.png)

Then search "quickwit" and click on the right plugin:

![grafana_search_ds_quickwit](../img/grafana_search_ds_quickwit.png)

Then click on "Add new datasource":

![grafana_add_new_ds_quickwit](../img/grafana_add_new_ds_quickwit.png)

Then fill the form:

![grafana_qw_ds_form](../img/grafana_qw_ds_form.png)

* Name: `otel-logs-v0_7`
* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-logs-v0_7`

Then click on "Save and tests":

![grafana_ds_qw_save_and_tests](../img/grafana_ds_qw_save_and_tests.png)

Then you'll be able to explore the data:

![grafana_explore_ds_qw](../img/grafana_explore_ds_qw.png)

Then you'll be able to run some queries:

![grafana_ds_qw_explorer](../img/grafana_ds_qw_explorer.png)