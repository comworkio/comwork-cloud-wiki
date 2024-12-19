# Analytics

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/observability/web_analytics.md)

## Purpose

You're used to track some Analytics from your various website using something like Google Analytics or Matomo?

In this tutorial, we'll see how to use CWCloud in order to easily track your website analytics using CWCloud and an observability system like [Grafana and Quickwit](./quickwit.md).

You can still choose to use Matomo deployed on CWCloud instead, you can see [this tutorial](../wpaas_matomo.md) in this case.

## Installer le tracker dans votre site

Les deux méthodes qui vont suivre doivent être implémentées côté frontend client.

### Using a RESTful endpoint in a script

In a script executed on the client browser, you can invoke this endpoint:

```
GET https://cloud-api.comwork.io/v1/tracker/json/{mywebsite}
```

The result should looks like:

```json
{
  "status": "ok",
  "type": "tracker",
  "time": "2024-12-19T20:06:02.556973",
  "host": "41.226.15.169",
  "user_agent": "curl/8.1.2",
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

### Using an image

It's possible to return an image in order to directly put this in your HTML code:

```html
<img src="https://cloud-api.comwork.io/v1/tracker/img/{mywebsite}" style="display: none;"></img>
```
