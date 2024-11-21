# Quickwit as a service

[Quickwit](https://www.quickwit.io) est une solution d'observabilité compatible avec Grafana, Jaegger et OpenTelemetry.

Pour le moment cela gère les logs et les traces et dispose d'un moteur de recherche très puissant écris en Rust (comparable à Apache Lucene utilisé par Elasticsearch et SolR) et cela permet également de stocker les documents indexés sur de l'object storage afin de réduire les coûts.

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/observability/quickwit.md)

## Installation et tests

Choisir l'environnement quickwit :

![quickwit_environment](../../../../img/quickwit_environment.png)

Une fois installé tester l'accès à Quickwit qui sera accessible à l'adresse `https://{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`. Les identifiants par défaut sont:

* Login: `quickwit`
* Mot de passe: `changeit`

![quickwit_gui](../../../../img/quickwit_gui.png)

Testez également avec les mêmes accès, Grafana qui sera accessible à l'adresse `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

![grafana_first_login](../../../../img/grafana_first_login.png)

Les identifiants par défaut sont les suivants :
* Username: `admin`
* Password: `admin`

Ensuite il vous sera demandé de les changer donc n'oubliez pas de retenir ce que vous allez choisir en lieu sûr !

## Problème de résolution DNS avec Grafana

Si vous recontrez des problèmes de connexions avec Grafana:
* Connectez-vous [avec ssh](../ssh.md)
* Vérifiez si vous avez des erreurs DNS dans le conteneur :

```shell
$ docker logs grafana -f
Error: ✗ failed to download plugin archive: Get "https://github.com/quickwit-oss/quickwit-datasource/releases/download/v0.4.5/quickwit-quickwit-datasource-0.4.5.zip": dial tcp: lookup github.com on 127.0.0.11:53: read udp 127.0.0.1:43845->127.0.0.11:53: i/o timeout
```

* Dans ce cas, il faut ajouter le flag suivant désactivé, dans le fichier `env/{env_name}.yml` :

```yaml
docker_disable_iptables: false
```

* Pushez, attendez que Grafana soit opérationnel et faites un retour arrière sur cette modification

## Changer de mot de passe

Vous pouvez changer votre mot de passe dans le fichier `env/{env_name}.yml` :

```yaml
gw_auth_files:
  - name: qw.keys
    users:
      - name: quickwit
        passwd: $apr1$M4x65b92$KsQCdoC.BzdBcuTai2MuG0
```

Pour générer un nouveau mot de passe hashé à copier dans le champs `passwd`:

```shell
htpasswd -c .htpasswd.tmp quickwit
cat .htpasswd.tmp | cut -d ":" -f2 # copier la sortie de passwd
rm -rf .htpasswd.tmp
```

## Changer le stockage avec de l'object storage

Pour demander de l'object storage, consultez [cette page](../../../../storage.md) pour avoir plus d'informations.

Supposons que vous ayez le bucket suivant :

![cwcloud_quickwit_bucket](../../../../img/cwcloud_quickwit_bucket.png)

Avec cet endpoint sur Scaleway : `https://qw-indexes-wmb0pz.s3.fr-par.scw.cloud`

Remplissez ces variables dans le fichier `env/{env_name}.yml` :

```yaml
quickwit_bucket_access_key_id: access_key_id_value
quickwit_bucket_secret_key: secret_key_id_value
quickwit_bucket_region: fr-par
quickwit_bucket_name: qw-indexes-wmb0pz
quickwit_bucket_endpoint: https://s3.fr-par.scw.cloud
```

Remplacer `access_key_id_value` et `secret_key_id_value` avec les identifiants que vous aurez généré dans votre _IAM_ (_Identity Access Management_).

Retournez sur Quickwit et vérifiez que les changements sont bien appliqués dans la configuration :

![quickwit_storage_settings](../../../../img/quickwit_storage_settings.png)

## Grafana datasource pour les logs

Retourner sur : `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Ajouter une nouvelle datasource :

![grafana_add_new_connection](../../../../img/grafana_add_new_connection.png)

Ensuite rechercher le plugin "quickwit" :

![grafana_search_ds_quickwit](../../../../img/grafana_search_ds_quickwit.png)

Ensuite cliquer sur "Add new datasource":

![grafana_add_new_ds_quickwit](../../../../img/grafana_add_new_ds_quickwit.png)

Ensuite remplir le formulaire :

![grafana_qw_ds_form](../../../../img/grafana_qw_ds_form.png)

* Name: `otel-logs-v0_7`
* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-logs-v0_7`

Ensuite cliquer sur "Save and tests":

![grafana_ds_qw_save_and_tests](../../../../img/grafana_ds_qw_save_and_tests.png)

Ensuite vous pourrez explorer les données :

![grafana_explore_ds_qw](../../../../img/grafana_explore_ds_qw.png)

Et enfin vous pourrez lancer des requêtes :

![grafana_ds_qw_explorer](../../../../img/grafana_ds_qw_explorer.png)

Comme vous pourrez le constater, il y a déjà quelques données du conteneur [imalive](./imalive.md) qui envoient des logs et traces via OpenTelemetry.

## Grafana datasources pour les traces

Créer une datasource _quickwit_ de la même façon avec la configuration suivante :

* Name: `otel-traces-v0_7`
* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-traces-v0_7`

Ensuite créer une datasource _jaeger_ :

![grafana_search_ds_jaeger](../../../../img/grafana_search_ds_jaeger.png)

Avec la configuration suivante :

* Name: `jaeger`
* URL: `http://jaeger:16686`

![grafana_jaeger_ds_form](../../../../img/grafana_jaeger_ds_form.png)

Ensuite cliquez sur _save and tests_ puis _explore_, vous pourrez voir les traces de [imalive](./imalive.md) ou de quickwit :

![grafana_jaeger_span](../../../../img/grafana_jaeger_span.png)

## Corréler les logs et les traces

Modifier les datasources `otel-logs-v0_7` et `otel-traces-v0_7` afin de rajouter un datalink avec la datasource `jaeger` :

![grafana_correlate_traces_otel_logs](../../../../img/grafana_correlate_traces_otel_logs.png)

![grafana_correlate_traces_otel_traces](../../../../img/grafana_correlate_traces_otel_traces.png)

Vous pourrez ainsi voir le datalink lorsque vous explorerez vous logs comme ceci :

![grafana_explore_datalink](../../../../img/grafana_explore_datalink.png)

Et si vous cliquez dessus vous pourrez voir les traces associées au log :

![grafana_correlate_logs_traces](../../../../img/grafana_correlate_logs_traces.png)

## Ingestion des logs et traces

En plus de l'API de quickwit, il y a deux endpoints publics OTLP grpc et http de la forme suivante :

* otlp/grpc: `https://otlp-grpc.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`
* otlp/http: `https://otlp-grpc.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Ils sont authentifiés avec les mêmes identifiants que pour accéder à quickwit (définies dans le fichier `qw.keys`).

Vous pouvez donc directement brancher vos applications en otlp ou bien continuer d'envoyer des logs en http à l'API `/ingest` de quickwit.

Si vous utilisez docker et que vous souhaitez indexer la sortie standard `stdout` ou la sortie d'erreur `stderr` de vos conteneurs ou bien si vous souhaitez tout simplement indexer des fichiers de logs sur disque, nous vous recommandons d'utiliser [vector](https://vector.dev).

Voici un exemple de configuration (fichier `/etc/vector/vector.yaml`) qui va à la fois ingérer les logs des sorties `stdout`/`stderr` de conteneurs docker ainsi que des fichiers de logs produits par une instance gitlab :

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

Remplacer `XXXXXXX` par le mot de passe définit dans `qw.keys`.
