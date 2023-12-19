# Gitlab

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](../translations/fr/tutorials/gitlab.md)

## Upgrade your gitlab runner

**1/** Connect with [ssh](./ssh.md)

**2/** Then:

```shell
sudo su -
cp /root/.gitlab-runner/config.toml /root/.gitlab-runner/config.toml.bak # Save the config.toml
yum upgrade gitlab-runner
mv /root/.gitlab-runner/config.toml.bak /root/.gitlab-runner/config.toml # Restore-it
```

Then edit the `/etc/systemd/system/gitlab-runner.service` file:

```shell
vim /etc/systemd/system/gitlab-runner.service
```

**3/** Comment the following line:

```shell
ExecStart=/usr/bin/gitlab-runner "run" "--working-directory" "/home/gitlab-runner" "--config" "/etc/gitlab-runner/config.toml" "--service" "gitlab-runner" "--user" "gitlab-runner"
```

And add the following line below:

```shell
# ExecStart=/usr/bin/gitlab-runner "run" "--working-directory" "/home/gitlab-runner" "--config" "/etc/gitlab-runner/config.toml" "--service" "gitlab-runner" "--user" "gitlab-runner"
ExecStart=/usr/bin/gitlab-runner run --working-directory /root --config /root/.gitlab-runner/config.toml --service gitlab-runner --user root
```

**4/** Reload and restart the runner:

```shell
systemctl daemon-reload
systemctl restart gitlab-runner
```

## The build folder seems corrupted

You get the following error?

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

**1/** Verify your gitlab runner is up to date (follow the previous procedure to upgrade)

**2/** Go [with ssh](./ssh.md) on the runner and remove the build folder like that:

```shell
sudo su -
rm -rf /root/builds/Vh7VZrH-
```

**3/** Then restart your pipelines.
