# Sizing and pricing

The sizing and pricing model is following the provider's ones and add 70% for our internal APIs and compute costs and support (you can see the details below).

So those pricing can be readjusted following the providers's pricing evolutions.

This page is automatically generated from [price_calculator](./price_calculator/README.md)

## Providers

The available providers are the following:

* `scw`: [Scaleway](https://www.scaleway.com)
* `ovh`: [OVH cloud](https://www.ovhcloud.com)

## Sizing

|Provider|Instance|CPU           |RAM    |DISK       |BANDWITH|
|--------|------------|--------------|-------|-----------|--------|
|scw     |DEV1-S      |2*x86 64 bits |2 Gb   |20 Gb NVMe |200 Mbps|
|scw     |DEV1-M      |3*x86 64 bits |4 Gb   |40 Gb NVMe |300 Mbps|
|scw     |DEV1-L      |4*x86 64 bits |8 Gb   |80 Gb NVMe |400 Mbps|
|scw     |DEV1-XL     |4*x86 64 bits |12 Gb  |120 Gb NVMe|500 Mbps|
|scw     |PLAY2-PICO  |1*x86 64 bits |2 Gb   |Block      |100 Mbps|
|scw     |PLAY2-NANO  |2*x86 64 bits |4 Gb   |Block      |200 Mbps|
|scw     |PLAY2-MICRO |4*x86 64 bits |8 Gb   |Block      |400 Mbps|
|ovh     |d2-4        |2*x86 64 bits |4 Gb   |50 Gb NVMe |250 Mbps|
|ovh     |d2-8        |4*x86 64 bits |8 Gb   |50 Gb NVMe |500 Mbps|
|ovh     |b2-15       |4*x86 64 bits |15 Gb  |100 Gb NVMe|250 Mbps|

## Datacenters locations

|Provider|Region|Country       |City       |
|--------|------|--------------|-----------|
|scw     |fr-par|France        |Paris      |
|scw     |nl-am |Nederland     |Amesterdam |
|scw     |pl-waw|Poland        |Warszawa   |
|ovh     |GRA   |France        |Graveline  |
|ovh     |SBG   |France        |Strasbourg |
|ovh     |UK    |United Kingdom|London     |
|ovh     |DE    |Germany       |Frankfurt  |
|ovh     |BHS   |Canada        |Beauharnois|
|ovh     |WAW   |Poland        |Warszawa   |

## Pricing

### Instances pricing

V_ARRAY_PRICING

*Updated the V_DATE*

### Details

|Data  |Details|Coef |
|------|-------|-------|
|Additional costs|Network, comwork api cost...|1,7    |
|Max number hours per months|24 hours * 31 days (max)|744    |
|VAT   |20% French VAT[^1]|1,2    |

## Additional services

Here's non-mandatory services we can provide:

* Email services: our email API that ensuire 10 000 mails / month for 5 euros / months[^2]. This API is based on [sendgrid.com](https://www.sendgrid.com), we can give you an http endpoint or a SMTP connection.
* Backups on object storage: for now it's free if you have at least one instance with a database (one bucket per database)

## Contact / subscription

Follow [this procedure](./subscription.md)

[^1]: for the customers based in EU, if it's not the case, you can reduce the estimmation by 20%. 
[^2]: for the customers based in EU, a French VAT of 20% will be applied.
