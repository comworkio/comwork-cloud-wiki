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
curl -L "https://packages.gitlab.com/install/repositories/runner/gitlab-runner/script.rpm.sh" | sudo bash
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

## Le dossier build semble corrompu

Vous avez l'erreur suivante ?

```shell
Running with gitlab-runner 16.6.1 (f5da3c5a)
  on imagesbuilder Vh7VZrH-, system ID: xxxxx
Preparing the "shell" executor
00:00
Using Shell (bash) executor...
Preparing environment
00:00
Running on imagesbuilder...
Getting source from Git repository
00:00
Fetching changes with git depth set to 20...
Reinitialized existing Git repository in /root/builds/Vh7VZrH-/0/myorga/myproject/.git/
error: RPC failed; HTTP 500 curl 22 The requested URL returned error: 500
fatal: error reading section header 'acknowledgments'
Cleaning up project directory and file based variables
00:00
ERROR: Job failed: exit status 1
```

**1/** Vérifier que votre gitlab runner est à jour (suivre la procédure au dessus)

**2/** Aller [en ssh](./ssh.md) sur le runner et supprimer le dossier build comme ceci :

```shell
sudo su -
rm -rf /root/builds/Vh7VZrH-
```

**3/** Relancez-vos pipelines.
