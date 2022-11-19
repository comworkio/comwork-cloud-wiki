# Mastodon as a service

## Getting started

1. Connect with [ssh](./ssh.md)

2. Execute the following command there:

```shell
docker-compose -f docker-compose-mastodon.yml run --rm shell bundle exec rake secret
docker-compose -f docker-compose-mastodon.yml run --rm shell bundle exec rake mastodon:webpush:generate_vapid_key
```

And add the following variable with the secrets generated in the ansible environment file (`env/{ instance_hash }.yml`):

```yaml
mastodon_secret_key: changeit
mastodon_vapid_private_key: changeit
mastodon_vapid_public_key: changeit
```

3. Your instance is ready on `https://{your_instance_hash}.mastodon.comwork.(cloud|dev|info)`, go setup your instance and first account there

4. On the SSH session you've opened earlier, register your user as the admin of instance using our rake task like that:

```shell
docker-compose -f docker-compose-mastodon.yml run -e USERNAME=YOUR_USERNAME --rm shell bundle exec rake comwork:set_admin
```
