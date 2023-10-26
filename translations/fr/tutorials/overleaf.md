# Overleaf as a service

[Overleaf](https://www.overleaf.com) est une plateforme opensource pour travailler sur des documents LaTeX avec une approche collaborative assez similaire à celle de gitlab ou github. Très adaptée pour une équipe de recherche et développement.

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :
* [English 🇬🇧](../../overleaf.md)

## Terminer l'installation

Une fois que l'instance a été provisionnée :

* [connectez-vous avec SSH](./ssh.md)
* Lancez cette commande :

```shell
$ docker exec sharelatex grunt user:create-admin --email=youremail@yourdomain.com
```

Vous obtiendrez cette sortie :

```shell
The grunt command is deprecated, run the create-user script using node instead
+ TASK=user:create-admin
+ shift 1
+ cd /overleaf/services/web
+ case "$TASK" in
+ echo 'The grunt command is deprecated, run the create-user script using node instead'
+ node modules/server-ce-scripts/scripts/create-user --admin --email=youremail@yourdomain.com
Using default settings from /overleaf/services/web/config/settings.defaults.js
Using settings from /etc/sharelatex/settings.js
Set UV_THREADPOOL_SIZE=16
{"name":"default-sharelatex","hostname":"c23ac327af9a","pid":450,"level":40,"msg":"Email transport and/or parameters not defined. No emails will be sent.","time":"2022-10-19T16:56:29.446Z","v":0}
Done.

Successfully created youremail@yourdomain.com as an admin user.

Please visit the following URL to set a password for youremail@yourdomain.com and log in:

  http://localhost/user/activate?token=b5322ce7f53e333413d4f86bb4a381462c590ba5a161187edce62904bc90ceba&user_id=63502c3dd762a601c22dc390
```

Ensuite vous pourrez ouvrir le lien affiché en remplaçant `http://localhost` par `https://{your_instance_hash}.overleaf.comwork.(cloud|dev|info)`.

Enfin cela vous demander de choisir un mot de passe administrateur :

![overleaf_setup_project](../../../img/overleaf_setup_project.png)

Vous pourrez par la suite vous connecter avec ce mot de passe.
