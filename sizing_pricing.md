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
|ovh     |b2-7    |2*x86 64 bits |7 Gb   |50 Gb NVMe |250 Mbps|
|ovh     |b2-15   |4*x86 64 bits |15 Gb  |100 Gb NVMe|250 Mbps|
|ovh     |b2-30   |8*x86 64 bits |30 Gb  |200 Gb NVMe|500 Mbps|
|ovh     |b2-60   |16*x86 64 bits|60 Gb  |400 Gb NVMe|1 Gbps  |
|ovh     |b2-120  |32*x86 64 bits|120 Gb |400 Gb NVMe|10 Gbps |

## Pricing

### Instances pricing

| Instance | Provider | Zone     | Original cost | Per hour | Per hour (TTC) | Per month (TTC) |
| -------- | -------- | -------- | ------------- | -------- | -------------- | --------------- |
| DEV1-S   | scw      | fr-par-1 | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | fr-par-1 | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | fr-par-1 | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | fr-par-1 | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | fr-par-2 | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | fr-par-2 | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | fr-par-2 | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | fr-par-2 | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | nl-am-1  | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | nl-am-1  | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | nl-am-1  | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | nl-am-1  | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | nl-am-2  | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | nl-am-2  | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | nl-am-2  | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | nl-am-2  | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| DEV1-S   | scw      | pl-waw-1 | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV1-M   | scw      | pl-waw-1 | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV1-L   | scw      | pl-waw-1 | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV1-XL  | scw      | pl-waw-1 | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |
| b2-7     | ovh      | UK1-nova | 0.0619 €      | 0.105 €  | 0.126 €        | 93.949 €        |
| b2-15    | ovh      | UK1-nova | 0.1169 €      | 0.140 €  | 0.168 €        | 125.242 €       |
| b2-30    | ovh      | UK1-nova | 0.2369 €      | 0.403 €  | 0.483 €        | 359.557 €       |
| b2-60    | ovh      | UK1-nova | 0.4589 €      | 0.780 €  | 0.936 €        | 696.500 €       |
| b2-120   | ovh      | UK1-nova | 0.9029 €      | 1.535 €  | 1.842 €        | 1 370.386 €     |


*Updated the 2022-08-24*

### Details

|Data  |Details|Coef |
|------|-------|-------|
|Additional costs|Network, comwork api cost...|1,7    |
|Max number hours per months|24 hours * 31 days (max)|744    |
|VAT   |20% French VAT|1,2    |

## Contact / subscription

Follow [this procedure](./subscription.md)
