# Serverless

We're developing our own FaaS[^1] platform which is agnostic and API-centric. We're also proposing to deploy other FaaS platform such as [OpenFaaS / Faasd](https://www.openfaas.com/blog/introducing-faasd/).

[^1]: functions as a service

## Translations

This page is also available in the following languages:
* [Français 🇫🇷](./translations/fr/serverless.md)

## Comwork cloud FaaS

Our FaaS engine is supporting the following languages:
* Python
* Go
* Javascript
* Bash

You can ask for this feature which is still in beta using the [support system](./tutorials/console/public/support.md).

### Demos

#### Supported programing languages

Here's a quick demo with the programing languages supported:

[![demo_faas](./img/demo_faas.png)](https://youtu.be/WgD2QlLeYtg)

Note: beware of protecting your function's arguments with a validation regexp, especially for Bash ;-)

#### Lowcode with blockly

It's also possible to use Blockly as a graphical programing (a.k.a "_lowcode_") interface:

[![demo_blockly](./img/demo_blockly.png)](https://youtu.be/ikBNQmlXJY8)

#### Tutorials

You can find tutorials [here](./tutorials/faas/README.md).

### Pricing

There's no pricing at this time, it's free and in beta. In the future, invocation execution time (in hours) will be billed.

## OpenFaas / Faasd

You can deploy a a lightweight OpenFaaS (Faasd) instance in order to deploy serverless functions and containers.

![faasd_gui](./img/faasd_gui.png)

### Demo and tutorial

You can find demo and tutorials [here](./tutorials/faasd.md)

### Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

### Sizing and pricing

Check it out [here](./sizing_pricing.md).
