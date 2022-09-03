# OpenFaaS / Faasd

## Video tutorial

This work is in progress...

## The CLI faas-cli

### Install and connect to the server

Install the faas cli if it's not already done:

```shell
curl -sSL https://cli.openfaas.com | sudo sh
```

### Authentication with faas-cli

```shell
export OPENFAAS_URL=https://{{ env_hashed_name }}.{{ environment }}.{{ root_dns_zone }}
faas-cli login --username cloud --password YOUR_PASSWORD
```

You'll find the password in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
faasd_user: cloud
faasd_password: YOUR_PASSWORD
```

### More about Faasd CLI

We advise you to get the ["Serverless for everyone else" book](https://openfaas.gumroad.com/l/serverless-for-everyone-else) from Alex Ellis (founder of OpenFaaS and Faasd) which explain everything you need to know for using Faasd CLI.
