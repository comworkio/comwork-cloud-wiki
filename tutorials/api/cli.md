# Cli cwc

`cwc` is a CLI written in go that will help you to manipulate the [comwork cloud API](./README.md) avoiding the breaking changes.

As it's written in go, it's pretty easy to ship into your IaC pipelines.

## Installation

### Using Curl

#### Linux

##### Linux x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.3.2/downloads/cwc_1.3.2_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

##### Linux arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.3.2/downloads/cwc_1.3.2_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

#### For MacOS

##### MacOS x86/arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.3.2/downloads/cwc_1.3.2_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

#### For Windows

##### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.3.2/downloads/cwc_1.3.2_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe
```

##### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.3.2/downloads/cwc_1.3.2_windows_arm64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd cwc_cli
cwc.exe
```

### Using homebrew

First installation:

```shell
brew tap cwc/cwc https://gitlab.comwork.io/oss/cwc/homebrew-cwc.git 
brew install cwc
```

Upgrade:

```shell
brew remove cwc
brew untap cwc/cwc
brew tap cwc/cwc https://gitlab.comwork.io/oss/cwc/homebrew-cwc.git 
brew install cwc
```

## Usage

### Usage, help version

```shell
cwc help # or -h or --help for getting help
cwc version # or -v or --version for getting the current version
```

### Generating an API access and secret key

Go on your settings using the web console and click on "Credentials":

![apikey_1](../../img/apikey_1.png)

Then click on "Generate API key":

![apikey_2](../../img/apikey_2.png)

Then store the access and secret key somewhere safe because you won't be able to see it anymore:

![apikey_3](../../img/apikey_3.png)



### List available providers
```shell
cwc provider ls
```

### List available regions
```shell
cwc region ls
```

### List Dns Zones
```shell
cwc dnszones ls
```

### Get environments Command

```shell
cwc environment ls
```



### Authentification Command

```shell
cwc login -a <access_key> -s <secret_key>
```

### Configure default endpoint, default provider and default region

```shell
cwc configure
```


### Get instances Command

```shell
cwc instance ls
```



### Create instance Command

```shell
cwc instance create -n <instance_name> -e <environement> -t <size> -i <project-id> -z <zone>
```
```shell
cwc instance create -n <instance_name> -e <environement> -t <size> -p <project-name> -z <zone>
```
    
### Attach instance Command

```shell
cwc instance attach -n <playbook-name> -t <size> -i <project-id> -z <zone>
```
```shell
cwc instance attach -n <playbook-name> -t <size> -p <project-name> -z <zone>
```

### Update instance status Command

```shell
cwc instance update -i <instanceId> -status <action>
```

```shell
cwc instance update --instance <instanceId> -status <action>
```
### Delete instance Command

```shell
cwc instance delete -i <instanceId>
```    

```shell
cwc instance delete --instance <instanceId>
```    
### Get projects Command

```shell
cwc project ls
```



### Get buckets Command

```shell
cwc bucket ls
```



### Update bucket credentials

```shell
cwc bucket update -b <bucketId>
```

```shell
cwc bucket update --bucket <bucketId>
```
### Delete bucket Command

```shell
cwc instance delete -b <bucketId>
```    


```shell
cwc instance delete --bucket <bucketId>
```    
### Get registries Command

```shell
cwc registry ls
```



### Update registry credentials

```shell
cwc registry update -r <registryId>
```

```shell
cwc registry update --registry <registryId>
```
### Delete registry Command

```shell
cwc registry delete -r <registryId>
```

```shell
cwc registry delete --registry <registryId>
```

### Create project Command

```shell
cwc project create -n <project_name>
```

### Delete project Command

```shell
cwc project delete -p <projectId>
```
