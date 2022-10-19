# Cli cwc

`cwc` is a CLI written in go that will help you to manipulate the [comwork cloud API](./README.md) avoiding the breaking changes.

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
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.5/downloads/cwc_1.5.5_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

##### Linux arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.5/downloads/cwc_1.5.5_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

#### For MacOS

##### MacOS x86/arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.5/downloads/cwc_1.5.5_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

#### For Windows

##### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.5/downloads/cwc_1.5.5_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe
```

##### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.5.5/downloads/cwc_1.5.5_windows_arm64.zip" -o "cwc_cli.zip"
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

### Default endpoint
#### Set

```shell
cwc configure -endpoint set <endpoint>
```

#### Get

```shell
cwc configure -endpoint get
```

### Default region

#### List available regions

```shell
cwc region ls
```

#### Set

```shell
cwc configure -region set <default_region>
```

#### Get

```shell
cwc configure -region get
```

### Default provider

#### List availables providers

```shell
cwc provider ls
```

#### Set

```shell
cwc configure -provider set <provider>
```
#### Get

```shell
cwc configure -provider get
```

### Projects

#### Create

```shell
cwc create project -name <project_name>
```

#### List

```shell
cwc get project --all
```

#### Get by id

```shell
cwc get project -id <projectId>
```

#### Delete

```shell
cwc delete project -id <projectId>
```

### Instances

#### Create

```shell
cwc create instance -name <instance_name> -env <environement> -instance_type <size> -project_id <project-id> -zone <zone>
```

Note: always use `nova` zone for ovh

#### List

```shell
cwc get instance --all
```

#### Get by id

```shell
cwc get instance -id <instanceId>
```
    
#### Attach

```shell
cwc attach instance -name <playbook-name> -instance_type <size> -project_id <project-id> -zone <zone>
```

#### Update status

```shell
cwc update instance -id <instanceId> -status <action>
```

#### Delete

```shell
cwc delete instance -id <instanceId>
```    

### Buckets / object storage

#### List

```shell
cwc get bucket --all
```

#### Get by id

```shell
cwc get bucket -id <bucketId>
```

#### Update credentials

```shell
cwc update bucket -id <bucketId>
```

#### Delete

```shell
cwc delete instance -id <bucketId>
```    

### OCI / Docker registries

#### List

```shell
cwc get registry --all
```

#### Get by id

```shell
cwc get registry -id <registryId>
```

#### Update credentials

```shell
cwc update registry -id <registryId>
```

#### Delete

```shell
cwc delete registry -id <registryId>
```

### Environments

### List

```shell
cwc get environment --all
```

### Get by id

```shell
cwc get environment -id <environmentId>
```
