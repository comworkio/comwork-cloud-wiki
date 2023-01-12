# Monitor and manage containers with portainer

You can manage all the containers that are deployed with docker (or kubernetes):

![portainer_1](../../img/portainer_1.png)

![portainer_2](../../img/portainer_2.png)

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/portainer/containers.md)

## Monitor logs of containers

You can watch logs from containers clicking on this icon:

![portainer_logs1](../../img/portainer_logs1.png)

Then you can read the live logs and download them in order to be able to opening them in a more suitable editor to perform some research:

![portainer_logs2](../../img/portainer_logs2.png)

## Opening a shell inside a container

For example, connecting inside redis:

![portainer_connect_container_1](../../img/portainer_connect_container_1.png)

Choose the shell available inside your container (i.e: `#!/bin/bash` here):

![portainer_connect_container_2](../../img/portainer_connect_container_2.png)

The launch your commands (here we use `redis-cli` in order to monitor what's is stored in redis):

![portainer_connect_container_3](../../img/portainer_connect_container_3.png)
