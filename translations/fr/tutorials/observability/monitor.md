# Moniteurs

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/observability/monitor.md)

## Objectifs

Un moniteur est un _healthcheck_ (contrôle de santé d'une application) qui est executé périodiquement. Pour l'instant nous n'implémentons que les healthcheck http avec les méthodes `GET`, `POST` et `PUT`. Dans le futur, nous prévoyons d'implémenter d'autres healthchecks.

Notre système de moniteur permet de :
* présenter le résultat du contrôle dans notre interface graphique
* exporter les résultats dans une gauge Prometheus/OpenMetrics disponible via le webservice `/v1/metrics` de l'API de CWCloud
* envoyer la métrique via opentelemetry vers un endpoint OTLP/grpc (configuré avec la variable d'environnement `OTEL_COLLECTOR_ENDPOINT`, pour plus de détail sur cette configuration lire [cette documentation](../selfhosted/configuration/observability.md) for that).

## Demo

Voici une démo de 10 minutes qui démontre comment utiliser cette fonctionnalité avec Quickwit et Grafana :

[![monitors_demo](../../../../img/monitor/monitor_with_quickwit_and_grafana_demo.png)](https://youtu.be/DYu6m1JQ-ds)

## Création d'un moniteur

_Observability > Monitor_

![monitors_create_interface](../../../../img/monitor/monitors_create_interface.png)

Notes :
* Pour les codes http retour attendu, vous pouvez utiliser le wildcard `*` qui sera évalué comme n'importe quel chiffre. Si vous configurez `20*`, le moniteur sera en succès si le code retour commence par `20`, comme par exemple `200`, `201`, `202`...
* Le moniteur échoue lorsque vous saisissez le champ `response body contain` et que la réponse ne contient pas la valeur saisie
* Vous pouvez configurer une authentification basic auth et des headers
* Pour les méthodes `POST` et `PUT` vous pouvez aussi configurer le body de la requête
* Vous pouvez utiliser la CLI pour créer les moniteurs, voir [cette documentation](../cli/public.md#moniteurs)

## Récupération des métriques Prometheus dans Quickwit

* Pour installer Quickwit via CWCloud, lire [ce tutoriel](./quickwit.md)
* Pour configurer Vector et Quickwit pour récupérer et indexer les métriques Prometheus, lire [ce blogpost](https://www.comwork.io/blog/quickwit-metrics)
