# Sizing and pricing

The sizing and pricing model is following the provider's ones and add 70% for our internal APIs and compute costs and support (you can see the details below).

So those pricing can be readjusted following the providers's pricing evolutions.

This page is automatically generated from [price_calculator](./price_calculator/README.md)

## Providers

The available providers are the following:

* `scw`: [Scaleway](https://www.scaleway.com)
* `ovh`: [OVH cloud](https://www.ovhcloud.com) (*in progress*)

## Sizing

|Provider|Instance|CPU           |RAM    |DISK       |BANDWITH|
|--------|--------|--------------|-------|-----------|--------|
|scw     |DEV1-S  |2*x86 64 bits |2 Gb   |20 Gb NVMe |200 Mbps|
|scw     |DEV1-M  |3*x86 64 bits |4 Gb   |40 Gb NVMe |300 Mbps|
|scw     |DEV1-L  |4*x86 64 bits |8 Gb   |80 Gb NVMe |400 Mbps|
|scw     |DEV1-XL |4*x86 64 bits |12 Gb  |120 Gb NVMe|500 Mbps|
|ovh     |d2-2    |1*x86 64 bits |2 Gb   |25 Gb NVMe |100 Mbps|
|ovh     |d2-4    |2*x86 64 bits |4 Gb   |50 Gb NVMe |250 Mbps|
|ovh     |d2-8    |4*x86 64 bits |8 Gb   |50 Gb NVMe |500 Mbps|
|ovh     |b2-15   |4*x86 64 bits |15 Gb  |100 Gb NVMe|250 Mbps|

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

| Instance | Provider | Zone       | Original cost | Per hour | Per hour (TTC) | Per month (TTC) |
| -------- | -------- | ---------- | ------------- | -------- | -------------- | --------------- |
| DEV1-S   | scw      | fr-par-1   | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | fr-par-1   | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | fr-par-1   | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | fr-par-1   | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | fr-par-2   | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | fr-par-2   | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | fr-par-2   | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | fr-par-2   | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | nl-am-1    | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | nl-am-1    | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | nl-am-1    | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | nl-am-1    | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | pl-waw-1   | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | pl-waw-1   | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | pl-waw-1   | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | pl-waw-1   | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| d2-2     | ovh      | UK1-nova   | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | UK1-nova   | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | UK1-nova   | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | UK1-nova   | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |
| d2-2     | ovh      | BHS5-nova  | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | BHS5-nova  | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | BHS5-nova  | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | BHS5-nova  | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |
| d2-2     | ovh      | SBG5-nova  | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | SBG5-nova  | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | SBG5-nova  | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | SBG5-nova  | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |
| d2-2     | ovh      | GRA11-nova | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | GRA11-nova | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | GRA11-nova | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | GRA11-nova | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |
| d2-2     | ovh      | DE1-nova   | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | DE1-nova   | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | DE1-nova   | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | DE1-nova   | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |
| d2-2     | ovh      | WAW1-nova  | 0.00901 €     | 0.015 €  | 0.018 €        | 13.675 €        |
| d2-4     | ovh      | WAW1-nova  | 0.01804 €     | 0.031 €  | 0.037 €        | 27.380 €        |
| d2-8     | ovh      | WAW1-nova  | 0.03248 €     | 0.055 €  | 0.066 €        | 49.297 €        |
| b2-15    | ovh      | WAW1-nova  | 0.11690 €     | 0.199 €  | 0.238 €        | 177.426 €       |


*Updated the 2022-09-14*

### Details

|Data  |Details|Coef |
|------|-------|-------|
|Additional costs|Network, comwork api cost...|1,7    |
|Max number hours per months|24 hours * 31 days (max)|744    |
|VAT   |20% French VAT|1,2    |

## Contact / subscription

Follow [this procedure](./subscription.md)
