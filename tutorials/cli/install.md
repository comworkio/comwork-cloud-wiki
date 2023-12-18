# Installation

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/cli/install.md)

## Homebrew

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

## Curl

### Linux

#### Linux x86 (64 bit)

```shell
version="1.10.9"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_linux_amd64.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

Beware of checking if the version is available in the [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) because we only keep the 5 last builds.

#### Linux arm (64 bit)

```shell
version="1.10.9"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_linux_arm64.tar.gz" -o "cwc_cli.tar.gz" 
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli 
sudo ./cwc_cli/install.sh
```

Beware of checking if the version is available in the [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) because we only keep the 5 last builds.

### For MacOS

#### MacOS x86/arm (64 bit)

```shell
version="1.10.9"
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v${version}/downloads/cwc_${version}_darwin_all.tar.gz" -o "cwc_cli.tar.gz"
mkdir cwc_cli && tar -xf cwc_cli.tar.gz -C cwc_cli     
sudo ./cwc_cli/install.sh
```

Beware of checking if the version is available in the [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) because we only keep the 5 last builds.

### For Windows

#### Windows x86 (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.10.9/downloads/cwc_1.10.9_windows_amd64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd 
cwc.exe
```

Beware of checking if the version is available in the [releases](https://gitlab.comwork.io/oss/cwc/cwc/-/releases) because we only keep the 5 last builds.

#### Windows arm (64 bit)

```shell
curl -L "https://gitlab.comwork.io/oss/cwc/cwc/-/releases/v1.10.9/downloads/cwc_1.10.9_windows_arm64.zip" -o "cwc_cli.zip"
unzip cwc_cli.zip 
cd cwc_cli
cwc.exe
```
