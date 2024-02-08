# Installation

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/cli/install.md)

## Homebrew

Première installation :

```shell
brew tap cwc/cwc https://gitlab.comwork.io/oss/cwc/homebrew-cwc.git 
brew install cwc
```

Mises à jour :

```shell
brew update
brew upgrade cwc
```

## Curl

### Linux

#### Linux x86 (64 bit)

```shell
version="1.11.2"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

Attention à vérifier que la version est disponible dans les [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) car nous ne gardons que les 5 dernières.

#### Linux arm (64 bit)

```shell
version="1.11.2"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

Attention à vérifier que la version est disponible dans les [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) car nous ne gardons que les 5 dernières.

### For MacOS

#### MacOS x86/arm (64 bit)

```shell
version="1.11.2"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

Attention à vérifier que la version est disponible dans les [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) car nous ne gardons que les 5 dernières.

### For Windows

#### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.11.2/downloads/cwc_1.11.2_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe
```

Attention à vérifier que la version est disponible dans les [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) car nous ne gardons que les 5 dernières.

#### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.11.2/downloads/cwc_1.11.2_windows_arm64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd cwc_cli
cwc.exe
```
