# Gateway as a service

A simple VPS that contains:

* A nginx load balancer/reverse proxy you can easily configure using ansible
* A docker runtime for running some custom apps (you might consider adding the [portainer agent role](./tutorials/portainer/agent.md) in order to use it as a portainer agent which will give you a better CaaS[^1] experience)
* A [metrics API/exporter imalive](./tutorials/observability/imalive.md) which is exposed with a TLS letsencrypt certificate
* A gitlab-runner that will run the ansible playbook once there is a git commit/push on the ansible configuration

![vps](./img/vps.png)

[^1]: Container as a service

## Minimal requirements

We advise to start with an instance >= [DEV1-S](./sizing_pricing.md)

## Sizing and pricing

Check it out [here](./sizing_pricing.md).
