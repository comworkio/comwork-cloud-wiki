# Serverless

Disclaimer: for now there's only [OpenFaaS / Faasd](https://www.openfaas.com/blog/introducing-faasd/) available but we intend to propose other FaaS (functions as a service) engines including our own one based on Google Cloud Functions framework.

## OpenFaas / Faasd

Deploy an OpenFaaS (faasd) instance and deploy a function "NodeInfo" which will print the instance sizing.

![faasd_provision](./img/faasd_provision.png)

Then you can deploy ready to use functions from the marketplace:

![faasd_gui](./img/faasd_gui.png)

You can also deploy your own functions or containers. Here's an example with our usual [imalive metrics exporter](./tutorials/imalive.md):

![faasd_imalive](./img/faasd_imalive.png)

## Demo and tutorial

You can find demo and tutorials [here](./tutorials/faasd.md)

### Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

### Sizing and pricing

Check it out [here](./sizing_pricing.md).
