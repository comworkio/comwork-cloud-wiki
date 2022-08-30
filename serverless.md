# Serverless

Disclaimer: for now there's only [OpenFaaS / Faasd](https://www.openfaas.com/blog/introducing-faasd/) available but we intend to propose other FaaS (functions as a service) engines and our own one based on Google Cloud Functions framework.

Also [portainer](./portainer.md) might also be considered as a FaaS engine in the future (they're working on it) and you can also use it with comwork cloud.

## OpenFaas / Faasd

Deploy an OpenFaaS (faasd) instance and deploy a function "NodeInfo" which will print the instance sizing.

![faasd_provision](./img/faasd_provision.png)

![faasd_gui](./img/faasd_gui.png)

### Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

### Sizing and pricing

Check it out [here](./sizing_pricing.md).
