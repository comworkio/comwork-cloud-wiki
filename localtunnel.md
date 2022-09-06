# Localtunnel server

Yet another http/https tunnel as service like [ngrok](https://ngrok.com) or [inlet](https://inlets.dev).

Unlike those two, you're creating your own instance:
* It can be hosted in the region you want (maybe this can help for IoT performances issues). It can be hosted in France 🇫🇷 with French providers (like Scaleway or OVH)
* You pay only for the sizing of the machines, not for a limited number of tunnels (a very small sizing can handle lot's of tunnel, probably more you'll ever use)
* This offer is build on top of [LocalTunnel Server](https://github.com/localtunnel/server) which is fully opensource (MIT licence). The CLI is available in any kind of devices including ARM/raspberrypi:

```shell
npm install -g localtunnel
lt --host https://yourinstance.lt.comwork.(cloud|dev|info) --port {the local port you want to expose} --subdomain localtunnel-1
```
