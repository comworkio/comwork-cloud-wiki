# Console

## Table of contents

[[_TOC_]]

## Public console

The console is here: https://cloud.comwork.io

First you can register and ask to the comwork team to enable your account with a conf meeting you can setup [here](https://calendly.com/idriss-neumann/intro-comwork-cloud).

Then you'll be able to create your gitlab projects:

![project](./img/project.png)

Then your instances:

![create_instance](./img/create_instance.png)

![created_instance](./img/create_instance.png)

After creating your instance, you'll be able manage it from the web console:

![instance](./img/instance.png)

## Administrators

### Manage environments

You can manage the environments which are a set of ansible roles and templates.

![environments](./img/environments.png)

Keeping environment private will make the environment not accessible for non-admin users.

![create_environment](./img/create_environment.png)

Beware of the roles order :
* `common`, `sudo`, `ssh` must be always there
* `gitlab-runner` must be the last one

If the `playbook-xxxx.yml` isn't in the right order, then you have to re-order all the roles one by one using the screen above.

Also you'll probably have to complete the jinja template `comwork-cloud-api/ansible/env/instance_name.yml.j2` to add the required values for your environment.

Then, if you need to see the ansible errors for the first time:
* Create a simple VM instance (on Almalinux, last version available)
* Git clone of the gitlab repo of your project
* Then try your playbook manually and fix all the errors you'll see in the role or jinja template:

```shell
dnf update
dnf install -y git epel-release
dnf install -y ansible
git clone https://gitlab.comwork.io/comwork/infrastructure/dynamic/YOUR_PROJECT.git
cd YOUR_PROJECT
./install.sh -e instance-YOUR_INSTANCE -p
```
