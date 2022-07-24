# Adding portainer agents on comwork cloud

4. You can install portainer edge agent this way:

1. Create "environment on your ansible role":

![portainer_edge_agent_1](../../img/portainer_edge_agent_1.png)

1. Keep the id and key values:

![portainer_edge_agent_2](../../img/portainer_edge_agent_2.png)

1. Install a [vps](../../vps.md)
2. Add our [ansible role](https://gitlab.comwork.io/oss/ansible-iac/portainer/ansible-portainer-agent) in the vps playbook
3. Change the following ansible variables with the previous key and id:

```yaml
portainer_agent_id: changeit
portainer_agent_key: changeit
```

We also got a demo video here:

[![portainer_agent_demo](../../img/portainer_agent_demo.png)](https://youtu.be/iYK2cwHQh1A)

You can activate the subtitles in English or French to get more details on this demo.

Enjoy!