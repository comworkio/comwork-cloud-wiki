# Connect to the machine with ssh

Add this configuration in the [`{ env_name }.yml` file:

```yaml
ssh_users:
  - username: cloud
    keys: 
      - {your public key}
```

Then, `git commit` and `git push` and wait for the end of the pipeline. You'll be able to connect with ssh:

```shell
ssh -i .ssh/your_private_key cloud@{your_instance_hash}.(wpaas|code|portainer|vps).comwork.cloud
```
