# Cli cwc

`cwc` is a CLI written in go that will help you to manipulate the [comwork cloud API](./README.md) avoiding the breaking changes.

As it's written in go, it's pretty easy to ship into your IaC pipelines.

## Installation

### Using Curl

#### Linux

##### Linux x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.1.4/downloads/cwc_1.1.4_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

##### Linux arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/occ/cwc/cwc/-/releases/v1.1.4/downloads/cwc_1.1.4_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

#### For MacOS

##### MacOS x86/arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/occ/cwc/cwc/-/releases/v1.1.4/downloads/cwc_1.1.4_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

#### For Windows

##### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/occ/cwc/cwc/-/releases/v1.1.4/downloads/cwc_1.1.4_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe

##### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/occ/cwc/cwc/-/releases/v1.1.4/downloads/cwc_1.1.4_windows_arm64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd cwc_cli
cwc.exe
```

### Using homebrew

```shell
brew tap cwc/cwc https://gitlab.comwork.io/occ/cwc/homebrew-cwc.git 
brew install cwc
```

## Usage

### Authentification Command

```shell
cwc login -u <email> -p <password>
```

### Configure default region Command

```shell
cwc configure -region <default_region>
```

### Get instances Command

```shell
cwc get instance --all
```

### Get instance by Id Command

```shell
cwc get instance -id <instanceId>
```

### Create instance Command

```shell
cwc create instance -name <project_name> -env <environement> -instance_type <size> -project_id <project-id>
```
    
### Attach instance Command

```shell
cwc attach instance -name <playbook-name> -instance_type <size> -project_id <project-id>
```

### Update instance status Command

```shell
cwc update instance -id <instanceId> -status <action>
```

### Delete instance Command

```shell
cwc delete instance -id <instanceId>
```    

### Get projects Command

```shell
cwc get project --all
```

### Get project by Id Command

```shell
cwc get project -id <instanceId>
```

### Create project Command

```shell
cwc create project -name <project_name>
```

### Delete project Command

```shell
cwc delete project -id <projectId>
```

### Get environments Command

```shell
cwc get environment --all
```

### Get environment by Id Command

```shell
cwc get environment -id <environmentId>
```
