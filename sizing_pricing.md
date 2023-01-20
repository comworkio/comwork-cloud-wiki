# Sizing and pricing

The sizing and pricing model is following the provider's ones and add 60% for our internal APIs and compute costs and support (you can see the details below).

So those pricing can be readjusted following the providers's pricing evolutions.

This page is automatically generated from [price_calculator](./price_calculator/README.md)

## Providers

The available providers are the following:

* `scw`: [Scaleway](https://www.scaleway.com)
* `ovh`: [OVH cloud](https://www.ovhcloud.com) (*in progress*)

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
|ovh     |d2-2        |1*x86 64 bits |2 Gb   |25 Gb NVMe |100 Mbps|
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

| Instance    | Provider | Original cost | Per hour | Per hour (TTC) | Per month (TTC) |
| ----------- | -------- | ------------- | -------- | -------------- | --------------- |
| DEV1-S      | scw      | 0.014 €       | 0.022 €  | 0.027 €        | 19.999 €        |
| DEV1-M      | scw      | 0.026 €       | 0.042 €  | 0.050 €        | 37.140 €        |
| DEV1-L      | scw      | 0.050 €       | 0.080 €  | 0.096 €        | 71.424 €        |
| DEV1-XL     | scw      | 0.073 €       | 0.117 €  | 0.140 €        | 104.279 €       |
| PLAY2-PICO  | scw      | 0.017 €       | 0.027 €  | 0.033 €        | 24.284 €        |
| PLAY2-NANO  | scw      | 0.030 €       | 0.048 €  | 0.058 €        | 42.854 €        |
| PLAY2-MICRO | scw      | 0.057 €       | 0.091 €  | 0.109 €        | 81.423 €        |
| d2-2        | ovh      | 0.0099 €      | 0.016 €  | 0.019 €        | 14.142 €        |
| d2-4        | ovh      | 0.0238 €      | 0.038 €  | 0.046 €        | 33.998 €        |
| d2-8        | ovh      | 0.0428 €      | 0.068 €  | 0.082 €        | 61.139 €        |
| b2-15       | ovh      | 0.1290 €      | 0.206 €  | 0.248 €        | 184.274 €       |


*Updated the 2023-01-20*

### Details

|Data  |Details|Coef |
|------|-------|-------|
|Additional costs|Network, comwork api cost...|1,7    |
|Max number hours per months|24 hours * 31 days (max)|744    |
|VAT   |20% French VAT|1,2    |

## Contact / subscription

Follow [this procedure](./subscription.md)
