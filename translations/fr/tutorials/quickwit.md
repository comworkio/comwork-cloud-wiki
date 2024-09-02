# Quickwit as a service

[Quickwit](https://www.quickwit.io) est une solution d'observabilité compatible avec Grafana, Jaegger et OpenTelemetry.

Pour le moment cela gère les logs et les traces et dispose d'un moteur de recherche très puissant écris en Rust (comparable à Apache Lucene utilisé par Elasticsearch et SolR) et cela permet également de stocker les documents indexés sur de l'object storage afin de réduire les coûts.

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/quickwit.md)

## Installation et tests

Choisir l'environnement quickwit :

![quickwit_environment](../../../img/quickwit_environment.png)

Une fois installé tester l'accès à Quickwit qui sera accessible à l'adresse `https://{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`. Les identifiants par défaut sont:

* Login: `quickwit`
* Mot de passe: `changeit`

![quickwit_gui](../../../img/quickwit_gui.png)

Testez également avec les mêmes accès, Grafana qui sera accessible à l'adresse `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

![grafana_first_login](../../../img/grafana_first_login.png)

Les identifiants par défaut sont les suivants :
* Username: `admin`
* Password: `admin`

Ensuite il vous sera demandé de les changer donc n'oubliez pas de retenir ce que vous allez choisir en lieu sûr !

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

## Grafana datasource pour les logs

Retourner sur : `https://grafana.{your_instance_hash}.quickwit.comwork.(cloud|dev|info)`

Ajouter une nouvelle datasource :

![grafana_add_new_connection](../../../img/grafana_add_new_connection.png)

Ensuite rechercher le plugin "quickwit" :

![grafana_search_ds_quickwit](../../../img/grafana_search_ds_quickwit.png)

Ensuite cliquer sur "Add new datasource":

![grafana_add_new_ds_quickwit](../../../img/grafana_add_new_ds_quickwit.png)

Ensuite remplir le formulaire :

![grafana_qw_ds_form](../../../img/grafana_qw_ds_form.png)

* URL: `http://quickwit:7280/api/v1`
* Index ID: `otel-logs-v0_7`

Ensuite cliquer sur "Save and tests":

![grafana_ds_qw_save_and_tests](../../../img/grafana_ds_qw_save_and_tests.png)

Ensuite vous pourrez explorer les données :

![grafana_explore_ds_qw](../../../img/grafana_explore_ds_qw.png)

Et enfin vous pourrez lancer des requêtes :

![grafana_ds_qw_explorer](../../../img/grafana_ds_qw_explorer.png)
