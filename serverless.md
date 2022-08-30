# Serverless

Disclaimer: for now there's only [OpenFaaS / Faasd](https://www.openfaas.com/blog/introducing-faasd/) available but we intend to propose other FaaS (functions as a service) engines and our own one based on Google Cloud Functions framework.

Also [portainer](./portainer.md) is also working on a FaaS engine according to [this tweet](https://twitter.com/portainerio/status/1563943478949986304?s=20&t=1Gra6AO0n1RrCoL6OSwY2Q). We'll keep this service up to date so you'll also might be able to benefit from this feature in the future.

## OpenFaas / Faasd

Deploy an OpenFaaS (faasd) instance and deploy a function "NodeInfo" which will print the instance sizing.

![faasd_provision](./img/faasd_provision.png)

![faasd_gui](./img/faasd_gui.png)

### Minimal requirements

We advise to start with an instance >= [DEV1-M](./sizing_pricing.md)

### Sizing and pricing

Check it out [here](./sizing_pricing.md).
