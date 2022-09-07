# Localtunnel server

## Video tutorial

[![demo_lt](../img/demo_lt.png)](https://youtu.be/2BZHMYcPfiY)

You can activate the subtitles in English or French to get more details on this demo. 

Enjoy!

## Use the CLI

### Allow your private network to the tunnelserver's firewall

First you have to allow your network public's ip where you need to expose port via tunnel. 

Get your public ip first:

```shell
curl ifconfig.me
```

Then, add the value in the firewall section in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
firewall_allow:
  # ...
  - ip: YOUR_PUBLIC_IP # to replace by the value returned by the previous curl
    cidr: 24
```

### Expose your service with the lt CLI

You can install the cli this way:

```shell
npm install -g localtunnel
```

Then, use it this way:

```shell
lt --host https://{your_instance_hash}.lt.comwork.(cloud|dev|info) --port {the port you want to expose} --subdomain localtunnel-1
```

### Work with multiple tunnels

Note: you can use multiple tunnels, you just have to add your tunnels subdomains in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
gw_proxies:
  # ...
  - domain: localtunnel-1.{your_instance_hash}.lt.comwork.(cloud|dev|info)
    target: localtunnel-1.{your_instance_hash}.lt.comwork.(cloud|dev|info):3200
  - domain: localtunnel-2.{your_instance_hash}.lt.comwork.(cloud|dev|info)
    target: localtunnel-2.{your_instance_hash}.lt.comwork.(cloud|dev|info):3200
  - domain: localtunnel-3.{your_instance_hash}.lt.comwork.(cloud|dev|info)
    target: localtunnel-3.{your_instance_hash}.lt.comwork.(cloud|dev|info):3200
```

Then you'll be able to open new tunnels with your client:

```shell
lt --host https://localtunnel-1.{your_instance_hash}.lt.comwork.(cloud|dev|info) --port 8080 --subdomain localtunnel-1
lt --host https://localtunnel-2.{your_instance_hash}.lt.comwork.(cloud|dev|info) --port 8081 --subdomain localtunnel-2
lt --host https://localtunnel-3.{your_instance_hash}.lt.comwork.(cloud|dev|info) --port 8082 --subdomain localtunnel-3
```

And share those urls:

```shell
https://localtunnel-1.{your_instance_hash}.lt.comwork.(cloud|dev|info)
https://localtunnel-2.{your_instance_hash}.lt.comwork.(cloud|dev|info)
https://localtunnel-3.{your_instance_hash}.lt.comwork.(cloud|dev|info)
```
