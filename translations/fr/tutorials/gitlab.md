# Gitlab

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../../tutorials/gitlab.md)

## Mettre à jour gitlab runner

**1/** Se connecter avec [ssh](./ssh.md)

**2/** Ensuite :

```shell
sudo su -
cp /root/.gitlab-runner/config.toml /root/.gitlab-runner/config.toml.bak # Sauvegarder le fichier config.toml
yum upgrade gitlab-runner
mv /root/.gitlab-runner/config.toml.bak /root/.gitlab-runner/config.toml # Restaurer le fichier config.toml
```

Ensuite modifier le fichier  `/etc/systemd/system/gitlab-runner.service` :

```shell
vim /etc/systemd/system/gitlab-runner.service
```

**3/** Commenter la ligne suivante :

```shell
ExecStart=/usr/bin/gitlab-runner "run" "--working-directory" "/home/gitlab-runner" "--config" "/etc/gitlab-runner/config.toml" "--service" "gitlab-runner" "--user" "gitlab-runner"
```

Ajouter en dessous la ligne suivantes :

```shell
# ExecStart=/usr/bin/gitlab-runner "run" "--working-directory" "/home/gitlab-runner" "--config" "/etc/gitlab-runner/config.toml" "--service" "gitlab-runner" "--user" "gitlab-runner"
ExecStart=/usr/bin/gitlab-runner run --working-directory /root --config /root/.gitlab-runner/config.toml --service gitlab-runner --user root
```

**4/** Recharger et redémarrer le service :

```shell
systemctl daemon-reload
systemctl restart gitlab-runner
```
