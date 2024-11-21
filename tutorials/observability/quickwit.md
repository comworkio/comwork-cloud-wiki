# Quickwit as a service

[Quickwit](https://www.quickwit.io) is a modern observability solution compliant with Grafana, Jaegger and OpenTelemetry.

For now it handles logs and traces with an efficiant search engine written in Rust (comparable to Apache Lucene used by Elasticsearch and Apache SolR) and it's able to store the data on object storage in order to lower the price.

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/observability/quickwit.md)

## Installation and tests

Choose the Quickwit environment:

![quickwit_environment](../../img/quickwit_environment.png)

Once the installation is finished, test the access to Quickwit's GUI with this URL: `https://{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`. The default credentials are:

* Username: `quickwit`
* Password: `changeit`

![quickwit_gui](../../img/quickwit_gui.png)

Then test with the same credentials, the Grafana's access with this URL: `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

![grafana_first_login](../../img/grafana_first_login.png)

The default grafana credentials are:
* Username: `admin`
* Password: `admin`

Then, you'll be asked to change-it, don't forget to remember-it somewhere safe!

## DNS issue with Grafana

If you have some issue to connect with grafana:
* Connect [with ssh](../ssh.md)
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

Ask for storage, see [this page](../../storage.md) to get more informations.

Let's suppose you have this bucket created:

![cwcloud_quickwit_bucket](../../img/cwcloud_quickwit_bucket.png)

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

![quickwit_storage_settings](../../img/quickwit_storage_settings.png)

## Grafana datasource for logs

Go back to Grafana: `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Add a new connection:

![grafana_add_new_connection](../../img/grafana_add_new_connection.png)

Then search "quickwit" and click on the right plugin:

![grafana_search_ds_quickwit](../../img/grafana_search_ds_quickwit.png)

Then click on "Add new datasource":

![grafana_add_new_ds_quickwit](../../img/grafana_add_new_ds_quickwit.png)

Then fill the form:

![grafana_qw_ds_form](../../img/grafana_qw_ds_form.png)

* Name: `otel-logs-v0_7`
* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-logs-v0_7`

Then click on "Save and tests":

![grafana_ds_qw_save_and_tests](../../img/grafana_ds_qw_save_and_tests.png)

Then you'll be able to explore the data:

![grafana_explore_ds_qw](../../img/grafana_explore_ds_qw.png)

Then you'll be able to run some queries:

![grafana_ds_qw_explorer](../../img/grafana_ds_qw_explorer.png)

As you can see, there's already some logs and traces sent by the [imalive](./imalive.md) container via OpenTelemetry.

## Grafana datasources for traces

Create a _quickwit_ datasource the same way:

* Name: `otel-traces-v0_7`
* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-traces-v0_7`

Create a _jaeger_ datasource:

![grafana_search_ds_jaeger](../../img/grafana_search_ds_jaeger.png)

* Name: `jaeger`
* URL: `http://jaeger:16686`

![grafana_jaeger_ds_form](../../img/grafana_jaeger_ds_form.png)

Then click on _save and tests_, and then _explore_. You'll be able to watch the traces from [imalive](./imalive.md) or quickwit itself:

![grafana_jaeger_span](../../img/grafana_jaeger_span.png)

## Correlate logs and traces

Edit the datasources `otel-logs-v0_7` and `otel-traces-v0_7` in order to add a datalink with the `jaeger` datasource:

![grafana_correlate_traces_otel_logs](../../img/grafana_correlate_traces_otel_logs.png)

![grafana_correlate_traces_otel_traces](../../img/grafana_correlate_traces_otel_traces.png)

Then you'll be able to find a datalink when you're exploring the logs :

![grafana_explore_datalink](../../img/grafana_explore_datalink.png)

And when you click on it, you'll be able to watch the associated traces with your logs:

![grafana_correlate_logs_traces](../../img/grafana_correlate_logs_traces.png)

## Logs and traces ingestion

In addition to the quickwit's API and two OTLP endpoint for grpc and http protocols:

* otlp/grpc: `https://otlp-grpc.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`
* otlp/http: `https://otlp-grpc.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Those endpoints are authenticated with the same credentials (defined in the `qw.keys` file).

You can directly plug your applications with otlp or continue to send logs via the quickwit `/ingest` endpoint.

If you're using docker and you want to index the `stdout` and `stderr` of your containers, or if you want to index a classic log file produced by an application on the filesystem, we recommand you to use [vector](https://vector.dev).

Here's an example of configuration (file `/etc/vector/vector.yaml`) who's ingesting the `stdout` and `stderr` of docker containers and log files produced by a gitlab instance :

```yaml
sources:
  log_docker:
    type: docker_logs

  log_files:
    type: file
    include:
      - "/var/opt/gitlab/gitlab-ci/builds/*/*/*.log"

transforms:
  remap_app_logs:
    inputs:
      - "log_files"
      - "log_docker"

    type: "remap"
    source: |
      .timestamp_nanos, _ = to_unix_timestamp(.timestamp, unit: "nanoseconds")

      .message = string!(.message)

      if contains(.message, "error", case_sensitive: false) || contains(.message, "errno", case_sensitive: false) {
        .message = replace(.message, r'^ERROR:[^:]*:', "")
        .severity_text = "ERROR"
      } else if contains(.message, "warn", case_sensitive: false) {
        .message = replace(.message, r'^WARNING:[^:]*:', "")
        .severity_text = "WARN"
      } else if contains(.message, "debug", case_sensitive: false) {
        .message = replace(.message, r'^DEBUG:[^:]*:', "")
        .severity_text = "DEBUG"
      } else {
        .message = replace(.message, r'^INFO:[^:]*:', "")
        .severity_text = "INFO"
      }

      .body, err = parse_json(.message)
      if err != null || is_null(.body) {
        .body = {"message": .message}
      } else {
        .body.message = .message
      }

      .resource_attributes.host.hostname, _ = get_hostname()

      if is_string(.container_name) {
        .service_name = .container_name
        .resource_attributes.service.name = .container_name
        .body.container_name = .container_name
      } else {
        .service_name = .resource_attributes.host.hostname
        .resource_attributes.service.name = .resource_attributes.host.hostname
      }

      if is_string(.container_id) {
        .body.container_id = del(.container_id)
      }

      if ! is_null(.container_created_at) {
        .body.container_created_at = del(.container_created_at)
      }

      if is_string(.stream) {
        .body.stream = del(.stream)
      }

      if is_string(.file) {
        .body.file = del(.file)
      }

      if is_string(.host) {
        .body.host = del(.host)
      }

      if is_string(.image) {
        .body.image = del(.image)
      }

      if ! is_null(.label) {
        .body.label = del(.label)
      }

      if is_string(.source_type) {
        .resource_attributes.source_type = .source_type
      } else if is_string(.container_name) {
        .resource_attributes.source_type = "docker"
      }

      del(.message)
      del(.timestamp)
      del(.source_type)
      del(.container_name)

sinks:
  quickwit_logs:
    type: "http"
    method: "post"
    inputs: ["remap_app_logs"]
    encoding:
      codec: "json"
    framing:
      method: "newline_delimited"
    uri: "https://quickwit:XXXXXXX@quickwit.comwork.io:443/api/v1/otel-logs-v0_7/ingest"
```

Replace `XXXXXXX` by the password defined in `qw.keys`.
