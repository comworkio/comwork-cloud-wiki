# Administrative commands in cwc cli

The administrative commands are used to control and manage your on premise version of comwork cloud.
To checkout how to install and update the cwc cli and also the user accessible commands checkout our [cwc tutorial](./api/cli.md)
NOTE: only users who have admin access can use this adminitrative commands.

## Usage

### Authentication

#### Generating an API access and secret key

Go on your settings using the web console and click on "Credentials":

![apikey_1](../../img/apikey_1.png)

Then click on "Generate API key":

![apikey_2](../../img/apikey_2.png)

Then store the access and secret key somewhere safe because you won't be able to see it anymore:

![apikey_3](../../img/apikey_3.png)


### Projects

#### List

```shell
cwc admin project ls
```

#### Search Project

##### Search Project By ID

```shell
cwc admin project ls -p <project_id>
```
```shell
cwc admin project ls --id <project_id>
```


##### Search Project By Name

```shell
cwc admin project ls -n <project_name>
```
```shell
cwc admin project ls --name <project_name>
```


##### Search Project By URL

```shell
cwc admin project ls -u <project_url>
```
```shell
cwc admin project ls --url <project_url>
```

#### Create

```shell
cwc admin project create -n <project_name>
```
Notes: 
* If you want to create a project in another Gitlab instance you can provide the Gitlab host, the group id, your access token and your git username by adding these options:
* `-h` or `--host`: Gitlab instance host
* `-t` or `--token`: your Gitlab access token
* `-g` or `--git`: Your Git username
* `-n` or `--namespace`: namespace or group id where the project will be created
#### Delete

##### Delete Project By ID

```shell
cwc admin project delete -p <project_id>
```
```shell
cwc admin project delete --id <project_id>
```


##### Delete Project By Name

```shell
cwc admin project delete -n <project_name>
```
```shell
cwc admin project delete --name <project_name>
```


##### Delete Project By URL

```shell
cwc admin project delete -u <project_url>
```
```shell
cwc admin project delete --url <project_url>
```

### Environments

#### List all environments

```shell
cwc admin environment ls
```

#### Get environment by ID

```shell
cwc admin environment ls -e <environment_id>
cwc admin environment ls --environment <environment_id>

```


### Instances

#### List instances

```shell
cwc admin instance ls
```

#### Get instance by ID

```shell
cwc admin instance ls -i <instance_id>
cwc admin instance ls --instance <instance_id>

```

#### Create

```shell
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone> -m <user_mail>
```

```shell
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone> -m <user_mail>
```

```shell
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone> -m <user_mail>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)
* use `--dns_zone` ou `-d` to choose the dns zone in which the instance will be created (you can list availble instances by running
`cwc dnszones ls`)

#### Update status

```shell
cwc admin instance update -i <instance_id> -s <action>
cwc admin instance update --instance <instance_id> --status <action>

```

* Note status must be `poweroff`, `poweron` or `reboot`

#### Delete

```shell
cwc admin instance delete -i <instance_id>
cwc admin instance delete --instance <instance_id>

```    

### Buckets / object storage

#### List all buckets

```shell
cwc admin bucket ls
```

#### Get bucket by ID

```shell
cwc admin bucket ls -b <bucket_id>
cwc admin bucket ls --bucket <bucket_id>

```

#### Update credentials

```shell
cwc admin bucket update -b <bucket_id>
cwc admin bucket update --bucket <bucket_id>
```

#### Delete

```shell
cwc admin bucket delete -b <bucket_id>
cwc admin bucket delete --bucket <bucket_id>
```    

### OCI / Docker registries

#### List

```shell
cwc registry ls
```

#### Get Registry by ID

```shell
cwc admin registry ls -r <registry_id>
cwc admin registry ls --registry <registry_id>

```

#### Update credentials

```shell
cwc admin registry update -r <registry_id>
cwc admin registry update --registry <registry_id>
```

#### Delete

```shell
cwc admin registry delete -r <registry_id>
cwc admin registry delete --registry <registry_id>
```
