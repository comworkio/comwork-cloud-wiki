# Sizing and pricing

The sizing and pricing model is following the [Scaleway's one](https://www.scaleway.com/en/pricing/?tags=available,compute-instances-developmentinstances) and add 70% for our internal APIs and compute costs and support (you can see the details below).

So those pricing can be readjusted following the Scaleway's pricing evolutions.

This markdown file is automatically generated from [price_calculator](./price_calculator/README.md)

## Table of contents

[[_TOC_]]

## Sizing

|Instance|CPU   |RAM    |DISK       |BANDWITH|
|--------|------|-------|-----------|--------|
|DEV-S   |2*x86 64 bits|2 Gb   |20 Gb NVMe |200 Mbps|
|DEV-M   |3*x86 64 bits|4 Gb   |40 Gb NVMe |300 Mbps|
|DEV-L   |4*x86 64 bits|8 Gb   |80 Gb NVMe |400 Mbps|
|DEV-XL  |4*x86 64 bits|12 Gb  |120 Gb NVMe|500 Mbps|

## Pricing

### Instances pricing

Theses prices are for the region `fr-par-1`, it can be a little bit different in other regions.

| Instance | Scaleway cost | Per hour | Per hour (TTC) | Per month (TTC) |
| -------- | ------------- | -------- | -------------- | --------------- |
| DEV-S    | 0.011 €       | 0.019 €  | 0.022 €        | 16.695 €        |
| DEV-M    | 0.022 €       | 0.037 €  | 0.045 €        | 33.391 €        |
| DEV-L    | 0.043 €       | 0.073 €  | 0.088 €        | 65.264 €        |
| DEV-XL   | 0.065 €       | 0.111 €  | 0.133 €        | 98.654 €        |


*Updated the 2022-07-10*

### Details

|Data  |Details|Coef |
|------|-------|-------|
|Additional costs|Network, comwork api cost...|1,7    |
|Max number hours per months|24 hours * 31 days (max)|744    |
|VAT   |20% French VAT|1,2    |

## Contact / subscription

See [here](./subscription.md)
