# Adding portainer agents on CwCloud

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../../translations/fr/tutorials/portainer/agent.md)

## How to add new agents

You can install portainer edge agent this way:

1. Create a "docker edge agent" environment:

![portainer_edge_agent_1](../../img/portainer_edge_agent_1.png)

2. Keep the id and key values:

![portainer_edge_agent_2](../../img/portainer_edge_agent_2.png)

3. Install a [vps[^1]](../../vps.md)
4. Add our [ansible role](https://gitlab.comwork.io/oss/ansible-iac/portainer/ansible-portainer-agent) in the vps playbook
5. Change the following ansible variables with the previous key and id:

```yaml
portainer_agent_id: changeit
portainer_agent_key: changeit
```

We also got a demo video here:

[![portainer_agent_demo](../../img/portainer_agent_demo.png)](https://youtu.be/iYK2cwHQh1A)

You can activate the subtitles in English or French to get more details on this demo.

Enjoy!

[^1]: virtual private server
