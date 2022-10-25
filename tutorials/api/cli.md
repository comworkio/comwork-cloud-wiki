# Cli cwc

`cwc` is a CLI written in go that will help you to manipulate the [comwork cloud API](./README.md) avoiding the breaking changes.

![cwc](../../img/cwc.png)

As it's written in go, it's pretty easy to ship into your IaC pipelines.

## Installation

### Homebrew

First installation:

```shell
brew tap cwc/cwc https://gitlab.comwork.io/oss/cwc/homebrew-cwc.git 
brew install cwc
```

Upgrade:

```shell
brew update
brew upgrade cwc
```

### Curl

#### Linux

##### Linux x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.7/downloads/cwc_1.5.7_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

##### Linux arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.7/downloads/cwc_1.5.7_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

#### For MacOS

##### MacOS x86/arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.7/downloads/cwc_1.5.7_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

#### For Windows

##### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.7/downloads/cwc_1.5.7_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe
```

##### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.7/downloads/cwc_1.5.7_windows_arm64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd cwc_cli
cwc.exe
```

## Usage

### Usage, help version

```shell
cwc help # or -h or --help for getting help
cwc version # or -v or --version for getting the current version
```

### Authentication

#### Generating an API access and secret key

Go on your settings using the web console and click on "Credentials":

![apikey_1](../../img/apikey_1.png)

Then click on "Generate API key":

![apikey_2](../../img/apikey_2.png)

Then store the access and secret key somewhere safe because you won't be able to see it anymore:

![apikey_3](../../img/apikey_3.png)

#### Login

```shell
cwc login -a <access_key> -s <secret_key>
```

### Default configurations

#### Read the current configurations

```shell
cwc configure get endpoint
cwc configure get provider
cwc configure get region
```

#### Configure

Configuring the default endpoint, default region and provider with:

```shell
cwc configure
```

You can tap enter if you want to keep the current value

```shell
$ cwc configure
Default endpoint [https://cloud-api.comwork.io]: 
Default provider [ovh]: 
Default region [UK1]: 
```

You can check available providers and regions with the following commands

```shell
cwc provider ls
cwc region ls # you have to set the provider to get the up to date list of available regions here
```

For each settings you also can configure with a specific command:

```shell
cwc configure set endpoint https://cloud-api.comwork.io
cwc configure set provider ovh
cwc configure set region UK1
```

### Projects

#### List

```shell
cwc project ls
```

#### Search Project

##### Search Project By ID

```shell
cwc project ls -p <project_id>
cwc project ls --id <project_id>
```

##### Search Project By Name

```shell
cwc project ls -n <project_name>
cwc project ls --name <project_name>
```


##### Search Project By URL

```shell
cwc project ls -u <project_url>
cwc project ls --url <project_url>
```

#### Create

```shell
cwc project create -n <project_name>
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
cwc project delete -p <project_id>
cwc project delete --id <project_id>
```


##### Delete Project By Name

```shell
cwc project delete -n <project_name>
cwc project delete --name <project_name>
```


##### Delete Project By URL

```shell
cwc project delete -u <project_url>
cwc project delete --url <project_url>
```

### DNS zones

#### List

```shell
cwc dnszones ls
```

### Environments

#### List

```shell
cwc environment ls
```

### Instances

#### List instances types of selected provider

```shell
cwc instance type ls
```

#### List instances

```shell
cwc instance ls
```

#### Create

```shell
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -p <project_name> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -i <project_id> -z <zone>
cwc instance create -n <instance_name> -e <environement> -t <instance_type> -u <project_url> -z <zone>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)
* use `--dns_zone` ou `-d` to choose the dns zone in which the instance will be created (you can list availble instances by running
`cwc dnszones ls`)

#### Attach

```shell
cwc instance attach -n <playbook_name> -t <instance_type> -p <project_name> -z <zone>
```

Notes: 
* use `nova` zone for ovh and `1` or `2` for scaleway
* `instance_type` corresponds to the provider instance sizing (i.e: `DEV1-M` for Scaleway)

#### Update status

```shell
cwc instance update -i <instance_id> -s <action>
```

* Note status must be `poweroff`, `poweron` or `reboot`

#### Delete

```shell
cwc instance delete -i <instance_id>
```    

### Buckets / object storage

#### List

```shell
cwc bucket ls
```

#### Update credentials

```shell
cwc bucket update -b <bucket_id>
cwc bucket update --bucket <bucket_id>
```

#### Delete

```shell
cwc bucket delete -b <bucket_id>
cwc bucket delete --bucket <bucket_id>
```    

### OCI / Docker registries

#### List

```shell
cwc registry ls
```

#### Update credentials

```shell
cwc registry update -r <registry_id>
cwc registry update --registry <registry_id>
```

#### Delete

```shell
cwc registry delete -r <registry_id>
cwc registry delete --registry <registry_id>
```
