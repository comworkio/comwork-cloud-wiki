# Public commands

Here's how to use `cwc` to perfom any actions you could do with the [web console](../console/README.md) and be able to code some automation/IaC scripts (i.e: shells scripts, ansible roles, terraform, etc).

Notes:
* To checkout how to install and update the `cwc` cli checkout this [tutorial](./install.md).
* For the commands accessible for the administrators, checkout this [tutorial](./admin.md)

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/cli/public.md)

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

```shell
cwc configure ls
```

This command will list the available config files available on your `.cwc` folder in your machine.

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

**Note**: After configuring your cli a config file will be created automatically in the `.cwc` folder in the home directory.

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

And you can also create a config file to use with the configuration you made:

```shell
cwc configure set config -c <config_file_name>
```

This will take the config file you choose and set up the configuration.

#### Output's formats

The know output's format are the following:

* `plain`: columns separated with spaces, usable in a shell script
* `json`: JSON format, usable in more high level programing languages
* `pretty`: more understandable output for human but not very usable in a program or shell scripts. This format can be punctually asked by adding `-p` or `--pretty` directly in your commands.

## Projects

### List

```shell
cwc project ls
```

### Search Project

#### Search Project By ID

```shell
cwc project ls -P <project_id>
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
cwc environment ls --environment <environment_id>pretty
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

## FaaS / Serverless

### Demo

[![demo_cli_faas](../../img/demo_cli_faas.png)](https://youtu.be/qZORLI73hok)

### Languages

#### List

```shell
cwc faas languages ls
```

### Serverless functions

#### List

```shell
cwc faas function ls
```

#### Get by ID

```shell
cwc faas function ls -f <function_id>
cwc faas function ls --function <function_id>
```

#### Create

```shell
cwc faas function create -n <function_name> -l <language_name>
cwc faas function create --name <function_name> --language <language_name>
```

* By default the function created is private if you add `-p` or `--public` flag the function becomes public.
* There are other optional flags for direct creation:  

```shell
-l # or --language: Language of the function
-r # or --regexp: regular expression for args protection
-u # or --callback-url: callback's URL
-a # or --callback-authorization-header: Authorization's header of the callback
-g # or --args arguments: (you can repeat this option for each argument's values)
-c # or --code: source code of the function
```

* Instead of entering the optional flags behind each other you can enter your data with the interactive mode by adding `-i` or `--interactive` flag.

#### Update

```shell
cwc faas function update -f <function_id>
cwc faas function update --function <function_id>
```

You can update the function by going through the interactive mode by adding `-i` or `--interactive` flag or you can pass your data directly with these optional flags:

```shell
-l # or --language: Language of the function
-r # or --regexp: regular expression for args protection
-u # or --callback-url: callback's URL
-a # or --callback-authorization-header: Authorization's header of the callback
-g # or --args arguments: (you can repeat this option for each argument's values)
-c # or --code: source code of the function
```

#### Delete

```shell
cwc faas function delete -f <function_id>
cwc faas function delete --function <function_id>
```

### Invocations

#### List

```shell
cwc faas invocation ls
```

#### Get by ID

```shell
cwc faas invocation ls -i <invocation_id>
cwc faas invocation ls --invocation <invocation_id>
```

#### Create

```shell
cwc faas invocation create -f <function_id>
cwc faas invocation create --function <function_id>
```

* There is other optional flag for direct creation:

```shell
-a # or --args: arguments (you can repeat this option for each argument's values)
-s # or --synchronous: enable the synchronous mode
```

* Instead of entering the optional flag you can enter your data with the interactive mode by adding `-i` or `--interactive` flag.

#### Delete

```shell
cwc faas invocation delete -i <invocation_id>
cwc faas invocation delete --invocation <invocation_id>
```

#### Truncate

```shell
cwc faas invocation truncate
```

### Triggers

#### List kinds

```shell
cwc faas trigger kinds
```

#### List

```shell
cwc faas trigger ls
```

#### Get by ID

```shell
cwc faas trigger ls -t  <trigger_id>
cwc faas trigger ls --trigger  <trigger_id>
```

#### Create

```shell
cwc faas trigger create -f <function_id>
cwc faas trigger create --function <function_id>
```
* There are other optional flags for direct creation:

```shell
-n # or --name: trigger's name
-k # or --kind: trigger' kind
-c # or --cron_expr: trigger's cron expression
-a # or --args: arguments (you can repeat this option for each argument's values)
```

* Instead of entering the optional flag you can enter your data with the interactive mode by adding `-i` or `--interactive` flag.

#### Delete

```shell
cwc faas trigger delete -t  <trigger_id>
cwc faas trigger delete --trigger  <trigger_id>
```

#### Truncate

```shell
cwc faas trigger truncate
```

## Email

### Send an email

You can send an email with the following command:

```shell
cwc email -t <recepient_email> -s <subject> -c <content>
```

Notes:
* There are other optional flags you can add:
  * `-f` to add customized expeditor email address
  * `-b` to add a bcc email address
