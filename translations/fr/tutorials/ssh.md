# Connect with ssh

In order to connect to the host of your services with SSH, add this configuration in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
ssh_users:
  - username: cloud
    keys: 
      - {your public key}
```

Then, `git commit` and `git push` and wait for the end of the pipeline. You'll be able to connect with ssh:

```shell
ssh -i ~/.ssh/your_private_key cloud@{your_instance_hash}.(wpaas|code|portainer|vps|lt|faasd).comwork.(cloud|dev|info)
```
