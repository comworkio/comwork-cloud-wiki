# Connection avec SSH

## Traductions

Ce tutoriel est également disponible dans les langues suivantes:
* [English 🇬🇧](../../ssh.md)

## Comment ajouter votre clef SSH

Afin de se connecter à votre instance avec SSH, vous pouvez ajouter cette configuration dans le fichier d'environnement ansible (`env/{ instance_hash }.yml` :

```yaml
ssh_users:
  - username: cloud
    keys: 
      - {your public key}
```

Ensuite faites `git commit` et `git push` et attendez la fin du pipeline. Vous serez alors en mesure de vous connecter en ssh comme ceci :

```shell
ssh -i ~/.ssh/your_private_key cloud@{your_instance_hash}.(wpaas|code|portainer|vps|lt|faasd).comwork.(cloud|dev|info)
```
