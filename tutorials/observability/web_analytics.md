# Analytics

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/observability/web_analytics.md)

## Purpose

You're used to track some Analytics from your various website using something like Google Analytics or Matomo?

In this tutorial, we'll see how to use CWCloud in order to easily track your website analytics using CWCloud and an observability system like [Grafana and Quickwit](./quickwit.md).

You can still choose to use Matomo deployed on CWCloud instead, you can see [this tutorial](../wpaas_matomo.md) in this case.

## Install the tracker in your website

The two following methods needs to be implemented on the client-side.

### Using a RESTful endpoint in a script

In a script executed on the client browser, you can invoke this endpoint:

```
GET https://api.cwcloud.tech/v1/tracker/json/{mywebsite}
```

The result should looks like:

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
    "lookup": "TNU",
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
<img src="https://api.cwcloud.tech/v1/tracker/img/{mywebsite}" style="display: none;"></img>
```

## Index data with Quickwit

In [this blogpost](https://www.comwork.io/blog/quickwit-web-analytics), you'll see in details how to index the data on Quickwit with Vector and set up dashboards with Grafana.
