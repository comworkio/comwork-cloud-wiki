# Public commands

Here's how to use `cwc` to perfom any actions you could do with the [web console](../console/README.md) and be able to code some automation/IaC scripts (i.e: shells scripts, ansible roles, terraform, etc).

Notes:
* To checkout how to install and update the `cwc` cli checkout this [tutorial](./install.md).
* For the commands accessible for the administrators, checkout this [tutorial](./admin.md)

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/cli/public.md)

## Usage, help version

```shell
cwc help # or -h or --help for getting help
cwc version # or -v or --version for getting the current version
```

## Authentication

### Login

```shell
cwc login -a <access_key> -s <secret_key>
```

In order to create the `access_key` and the `secret_key`, you can checkout [this tutorial](../api/api_credentials.md).

## Default configurations

### Read the current configurations

```shell
cwc configure get endpoint
cwc configure get provider
cwc configure get region
cwc configure get format

```

### Configure

Configuring the default endpoint, default region, default output format and provider with:

```shell
cwc configure
```

You can tap enter if you want to keep the current value:

```shell
$ cwc configure
Default endpoint [https://cloud-api.comwork.io]: 
Default provider [ovh]: 
Default region [UK1]: 
Default format [json]: 

```

You can check available providers and regions with the following commands:

```shell
cwc provider ls
cwc region ls # you have to set the provider to get the up to date list of available regions here
```

For each settings you also can configure with a specific command:

```shell
cwc configure set endpoint https://cloud-api.comwork.io
cwc configure set provider ovh
cwc configure set region UK1
cwc configure set format json
```

## Projects

### List

```shell
cwc project ls
```

### Search Project

#### Search Project By ID

```shell
cwc project ls -p <project_id>
cwc project ls --id <project_id>
```

#### Search Project By Name

```shell
cwc project ls -n <project_name>
cwc project ls --name <project_name>
```

#### Search Project By URL

```shell
cwc project ls -u <project_url>
cwc project ls --url <project_url>
```

### Create

```shell
cwc project create -n <project_name>
```

Notes: 
* If you want to create a project in another Gitlab instance you can provide the Gitlab host, the group id, your access token and your git username by adding these options:
  * `-h` or `--host`: Gitlab instance host
  * `-t` or `--token`: your Gitlab access token
  * `-g` or `--git`: Your Git username
  * `-n` or `--namespace`: namespace or group id where the project will be created

### Delete

#### Delete Project By ID

```shell
cwc project delete -p <project_id>
cwc project delete --id <project_id>
```

#### Delete Project By Name

```shell
cwc project delete -n <project_name>
cwc project delete --name <project_name>
```

#### Delete Project By URL

```shell
cwc project delete -u <project_url>
cwc project delete --url <project_url>
```

## DNS zones

### List

```shell
cwc dnszones ls
```

## Environments

#### List

```shell
cwc environment ls
```

### Get by ID

```shell
cwc environment ls -e <environment_id>
cwc environment ls --environment <environment_id>
```

## Instances

### List instances types of selected provider

```shell
cwc instance type ls
```

### List instances

```shell
cwc instance ls
```

### List instance by ID

```shell
cwc instance ls -i <instance_id>
cwc instance ls --instance <instance_id>
```

### Create

```shell
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)
* use `--dns_zone` or `-d` to choose the dns zone in which the instance will be created (you can list availble zones using `cwc dnszones ls`)

### Attach

```shell
cwc instance attach -n <playbook_name> -t <instance_type> -p <project_name> -z <zone>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)

### Update status

```shell
cwc instance update -i <instance_id> -s <action>
```

Notes:
* The status must be `poweroff`, `poweron` or `reboot`

### Delete

```shell
cwc instance delete -i <instance_id>
cwc instance delete --instance <instance_id>
```    

## Buckets / object storage

### List

```shell
cwc bucket ls
```

### Get by ID

```shell
cwc bucket ls -b <bucket_id>
cwc bucket ls --bucket <bucket_id>
```

### Update credentials

```shell
cwc bucket update -b <bucket_id>
cwc bucket update --bucket <bucket_id>
```

### Delete

```shell
cwc bucket delete -b <bucket_id>
cwc bucket delete --bucket <bucket_id>
```    

## OCI / Docker registries

### List

```shell
cwc registry ls
```

### Get by ID

```shell
cwc registry ls -r <registry_id>
cwc registry ls --registry <registry_id>
```

### Update credentials

```shell
cwc registry update -r <registry_id>
cwc registry update --registry <registry_id>
```

### Delete

```shell
cwc registry delete -r <registry_id>
cwc registry delete --registry <registry_id>
```

## Faas languages & trigger kinds

## List languages

```shell
cwc faas languages ls 
```

## List trigger kinds

```shell
cwc faas trigger-kinds ls
```

## Faas function

### List

```shell
cwc faas function ls
```

### Get by ID

```shell
cwc faas function ls -f <function_id>
cwc faas function ls --function <function_id>
```

## Create

```shell
cwc faas function create -n <function_name> -l <language_name>
cwc faas function create --name <function_name> --language <language_name>
```

By default the function created is private if you add `-p` or `--public` flag the function becomes public.

### Update

```shell
cwc faas function update -f <function_id>
cwc faas function update --function <function_id>
```

### Delete

```shell
cwc faas function delete -f <function_id>
cwc faas function delete --function <function_id>
```

## Faas invocation

### List

```shell
cwc faas invocation ls
```

### Create

```shell
cwc faas invocation create -f <function_id>
cwc faas invocation create --function <function_id>
```

### Get by ID

```shell
cwc faas invocation ls -i <invocation_id>
cwc faas invocation ls --invocation <invocation_id>
```

### Delete

```shell
cwc faas invocation delete -i <invocation_id>
cwc faas invocation delete --invocation <invocation_id>
```

## Faas Trigger

### List

```shell
cwc faas trigger ls
```

### Create

```shell
cwc faas trigger create -f <function_id>
cwc faas trigger create --function <function_id>
```

### Get by ID

```shell
cwc faas trigger ls -t  <trigger_id>
cwc faas trigger ls --trigger  <trigger_id>
```

### Delete

```shell
cwc faas trigger delete -t  <trigger_id>
cwc faas trigger delete --trigger  <trigger_id>
```