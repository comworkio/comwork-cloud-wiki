# Connect with ssh

## Translations

This tutorial is also available in the following languages:
* [Français 🇫🇷](./translations/fr/ssh.md)

## How to add your SSH key

In order to connect to the host of your services with SSH, add this configuration in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
ssh_users:
  - username: cloud
    keys: 
      - {your public key}
```

For those who are using PuTTy on Windows, the public key must be exported in the OpenSSH format like that:

```shell
ssh-keygen -i -f public_putty.pub > id_rsa.pub
cat id_rsa.pub
```

Then, `git commit` and `git push` and wait for the end of the pipeline. You'll be able to connect with ssh:

```shell
ssh -i ~/.ssh/your_private_key cloud@{your_instance_hash}.(wpaas|code|portainer|vps|lt|faasd).comwork.(cloud|dev|info)
```
