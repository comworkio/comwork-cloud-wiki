# Observabilité

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/configuration/observability.md)

## Configuration

Cwcloud-api expose un webservice `/metrics` qui peux être scrappé par Prometheus:

![prometheus](../../../../../img/prometheus.png)

Vous pouvez également envoyer les métriques, logs et traces à partir d'un endpoint OTLP/Grpc (configuré avec la variable d'environnement `OTEL_COLLECTOR_ENDPOINT`).

Voici un exemple de traces avec Jaegger:

![jaegger](../../../../../img/jaegger.png)
