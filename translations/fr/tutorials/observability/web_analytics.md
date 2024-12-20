# Analytics

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/observability/web_analytics.md)

## Objectifs

Vous avez l'habitude de collecter vos données de site web via Google Analytics ou Matomo ?

Dans ce tutoriel nous verrons comment nous pouvons utiliser CWCloud à la place de ce type d'outil, associé à une stack d'observabilité telle que [Grafana et Quickwit](./quickwit.md).

Vous pouvez toujours choisir de déployer Matomo avec CWCloud, dans ce cas vous pourrez allez voir [ce tutoriel](../wpaas_matomo.md).

## Installer le tracker dans votre site

Les deux méthodes qui vont suivre doivent être implémentées côté frontend client.

### Via l'API dans un script

Dans un script qui s'exécute côté client, vous pouvez invoquer le endpoint suivant :

```
GET https://cloud-api.comwork.io/v1/tracker/json/{mywebsite}
```

Le résultat va ressembler à ceci :

```json
{
  "status": "ok",
  "type": "tracker",
  "time": "2024-12-19T20:06:02.556973",
  "host": "41.226.15.169",
  "user_agent": "Mozilla/5.0 (iPhone; CPU iPhone OS 18_1_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/18.1.1 Mobile/15E148 Safari/604.1",
  "os": "ios",
  "device": "mobile",
  "browser": "safari",
  "details": {
    "brand": "apple",
    "type": "iphone"
  },
  "referrer": "None",
  "website": "mywebsite",
  "infos": {
    "status": "ok",
    "status_code": 200,
    "city": "Tunis",
    "region": "Tunis Governorate",
    "country": "Tunisia",
    "region_code": "11",
    "country_iso": "TN",
    "timezone": "Africa/Tunis",
    "utc_offset": "TN",
    "currency": "TND",
    "asn": "AS37705",
    "org": "TOPNET",
    "ip": "41.226.15.169",
    "network": "41.226.12.0/22",
    "version": "IPv4",
    "hostname": "unknown",
    "loc": "36.8190,10.1658"
  },
  "level": "INFO",
  "cid": "f5057c99-9f0c-44a3-873a-e25567decfa4"
}
```

### Via une image

Il est possible de renvoyer une image afin de directement mettre ceci dans votre code HTML :

```html
<img src="https://cloud-api.comwork.io/v1/tracker/img/{mywebsite}" style="display: none;"></img>
```
