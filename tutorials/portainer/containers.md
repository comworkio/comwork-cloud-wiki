# Monitor and manager containers with portainer

You can manage all the containers that are deployed with docker on your servers:

![portainer_1](../../img/portainer_1.png)

![portainer_2](../../img/portainer_2.png)

## Opening a shell inside a container

For example, connecting inside redis:

![portainer_connect_container_1](../../img/portainer_connect_container_1.png)

Choose the shell available inside your container (i.e: `#!/bin/bash` here):

![portainer_connect_container_2](../../img/portainer_connect_container_2.png)

The launch your commands (here we use `redis-cli` in order to monitor what's is stored in redis):

![portainer_connect_container_3](../../img/portainer_connect_container_3.png)
