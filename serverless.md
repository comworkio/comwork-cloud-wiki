# Serverless

We're developing our own FaaS[^1] platform which is agnostic and API-centric. We're also proposing to deploy other FaaS platform such as [OpenFaaS / Faasd](https://www.openfaas.com/blog/introducing-faasd/).

[^1]: functions as a service

## Comwork cloud FaaS

Our FaaS engine is supporting the following languages:
* Python
* Go
* Javascript
* Bash

You can ask for this feature which is still in beta using the [support system](./tutorials/console/public/support.md).

Here's a quick demo:

[![demo_faas](./img/demo_faas.png)](https://youtu.be/WgD2QlLeYtg)

Note: beware of protecting your function's arguments with a validation regexp, especially for Bash ;-)

## OpenFaas / Faasd

Deploy an OpenFaaS (faasd) instance and deploy a function "NodeInfo" which will print the instance sizing.

![faasd_provision](./img/faasd_provision.png)

Then you can deploy ready to use functions from the marketplace:

![faasd_gui](./img/faasd_gui.png)

You can also deploy your own functions or containers. Here's an example with our usual [imalive metrics exporter](./tutorials/imalive.md):

![faasd_imalive](./img/faasd_imalive.png)

### Demo and tutorial

You can find demo and tutorials [here](./tutorials/faasd.md)

#### Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

#### Sizing and pricing

Check it out [here](./sizing_pricing.md).
