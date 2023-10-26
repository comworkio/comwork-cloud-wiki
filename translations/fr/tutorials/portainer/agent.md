# Déployer des agents portainer avec CwCloud

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../portainer/agent.md)

## Comment ajouter des agents

Vous pouvez ajouter des agents portainers de cette façon :

1. Créer un environnement "docker edge agent" :

![portainer_edge_agent_1](../../../../img/portainer_edge_agent_1.png)

2. Garder la clef et l'id qui sont générés :

![portainer_edge_agent_2](../../../../img/portainer_edge_agent_2.png)

3. Installer un [vps[^1]](../../../../vps.md)
4. Ajouter notre rôle ansible [portainer-agent](https://gitlab.comwork.io/oss/ansible-iac/portainer/ansible-portainer-agent) dans le playbook du vps
5. Changer les paramètres suivants dans les variables ansible avec les valeurs générées précedemment :

```yaml
portainer_agent_id: changeit
portainer_agent_key: changeit
```

Nous avons également une démo vidéo disponible ici :

[![portainer_agent_demo](../../../../img/portainer_agent_demo.png)](https://youtu.be/iYK2cwHQh1A)

Vous pouvez activer les sous-titres en Anglais ou Français.

[^1]: virtual private server (simple serveur virtuel / compute instance)
