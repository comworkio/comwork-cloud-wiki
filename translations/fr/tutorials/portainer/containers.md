# Monitorer et gérer vos conteneurs docker

Vous pouvez monitorer et gérer l'ensemble de vos conteneurs déployés via docker (ou kubernetes) avec portainer :

![portainer_1](../../../../img/portainer_1.png)

![portainer_2](../../../../img/portainer_2.png)

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../../tutorials/portainer/containers.md)

## Monitorer les logs des conteneurs

Vous pouvez observer les logs en cliquant sur cet icône :

![portainer_logs1](../../../../img/portainer_logs1.png)

Vous pourrez lire les logs en temps réel ou bien les télécharger afin de pouvoir les ouvrir dans un éditeur de texte plus confortable pour pouvoir faire des recherches :

![portainer_logs2](../../../../img/portainer_logs2.png)

## Ouvrir une session shell dans un conteneur

Par exemple, ouvrir une ligne de commande redis sur un conteneur redis :

![portainer_connect_container_1](../../../../img/portainer_connect_container_1.png)

Vous devez choisir un shell qui est disponible et installé sur votre conteneur (par exemple `#!/bin/bash` ici) :

![portainer_connect_container_2](../../../../img/portainer_connect_container_2.png)

Vous pourrez ensuite lancer vos commandes (on utilise `redis-cli` ici afin de monitorer ce qui est stocké dans redis) :

![portainer_connect_container_3](../../../../img/portainer_connect_container_3.png)
