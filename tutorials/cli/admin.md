# Admin commands

The admin commands are used to control and manage your on premise version of comwork cloud.

Notes:
* Those commands are only for admin users (if you're using a [self-hosted version](../onprem.md) for example)
* To checkout how to install and update the cwc cli checkout this [tutorial](./install.md)
* For the commands accessible for all users, checkout this [tutorial](./public.md) (you should read-it first to handle authentication)

## Users

### List

```shell
cwc admin user ls
```

### Get user by ID

```shell
cwc admin user ls -u <user_id>
cwc admin user ls --user <user_id>
```

### Delete

```shell
cwc admin user delete -u <user_id>
cwc admin user delete --user <user_id>
```

## Projects

### List

```shell
cwc admin project ls
```

### Search Project

#### Search Project By ID

```shell
cwc admin project ls -p <project_id>
cwc admin project ls --id <project_id>
```

#### Search Project By Name

```shell
cwc admin project ls -n <project_name>
cwc admin project ls --name <project_name>
```

#### Search Project By URL

```shell
cwc admin project ls -u <project_url>
cwc admin project ls --url <project_url>
```

### Create

```shell
cwc admin project create -n <project_name>
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
cwc admin project delete -p <project_id>
cwc admin project delete --id <project_id>
```

#### Delete Project By Name

```shell
cwc admin project delete -n <project_name>
cwc admin project delete --name <project_name>
```

#### Delete Project By URL

```shell
cwc admin project delete -u <project_url>
cwc admin project delete --url <project_url>
```

## Environments

### Add environment

```shell
cwc admin environment create -n <name> -r <role1>,<role2>  -m <main_role> -p <path> -d <description> -s <subdomain1>,<subdomain2>
cwc admin environment create --name <name> --roles <role1>,<role2>  -main-role <main_role> --path <path> --description <description> --subdomains <subdomain1>,<subdomain2>
```

Note: if you want to mark the environment as private use the -a or --private flag.


### List all environments

```shell
cwc admin environment ls
```

### Get environment by ID

```shell
cwc admin environment ls -e <environment_id>
cwc admin environment ls --environment <environment_id>
```

## Instances

### List instances

```shell
cwc admin instance ls
```

### Get instance by ID

```shell
cwc admin instance ls -i <instance_id>
cwc admin instance ls --instance <instance_id>

```

### Create

```shell
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone> -m <user_mail>
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone> -m <user_mail>
cwc admin instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone> -m <user_mail>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)
* use `--dns_zone` ou `-d` to choose the dns zone in which the instance will be created (you can list availble instances by running
`cwc dnszones ls`)

### Update status

```shell
cwc admin instance update -i <instance_id> -s <action>
cwc admin instance update --instance <instance_id> --status <action>
```

Note: status must be `poweroff`, `poweron` or `reboot`

### Delete

```shell
cwc admin instance delete -i <instance_id>
cwc admin instance delete --instance <instance_id>
```    
### Refresh state

```shell
cwc admin instance refresh -i <instance_id>
cwc admin instance refresh --instance <instance_id>
```    
## Buckets / object storage

### Add bucket to a user

```shell
cwc admin bucket create -n <bucket_name> -t <bucket_type> -u <user_mail>
cwc admin bucket create --name <bucket_name> --type <bucket_type> --user <user_mail>
```

### List all buckets

```shell
cwc admin bucket ls
```

### Get bucket by ID

```shell
cwc admin bucket ls -b <bucket_id>
cwc admin bucket ls --bucket <bucket_id>
```

### Update credentials

```shell
cwc admin bucket update -b <bucket_id>
cwc admin bucket update --bucket <bucket_id>
```

### Delete

```shell
cwc admin bucket delete -b <bucket_id>
cwc admin bucket delete --bucket <bucket_id>
```    

## OCI / Docker registries

### Add registry to a user

```shell
cwc admin registry create -n <registry_name> -t <registry_type> -u <user_mail>
cwc admin registry create --name <registry_name> --type <registry_type> --user <user_mail>
```

### List

```shell
cwc admin registry ls
```

### Get Registry by ID

```shell
cwc admin registry ls -r <registry_id>
cwc admin registry ls --registry <registry_id>
```

### Update credentials

```shell
cwc admin registry update -r <registry_id>
cwc admin registry update --registry <registry_id>
```

### Delete

```shell
cwc admin registry delete -r <registry_id>
cwc admin registry delete --registry <registry_id>
```
