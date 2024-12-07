# Configurer AWS

Dans ce tutoriel, nous verrons comment générer des clés d'accès et des clés secrètes avec AWS. Ensuite, nous verrons comment obtenir l'ID de sous-réseau pour chaque zone de disponibilité (`a`, `b`, `c`...), l'ID du groupe de sécurité ainsi que l'ID de la zone DNS hébergée.

## Traductions

Ce tutoriel est également disponible dans les langues suivantes :

* [English 🇬🇧](../../../../../tutorials/selfhosted/configuration/aws.md)

## Configuration

### Choisir une région

Sur la droite de la page d'accueil de la console, vous pouvez trouver une liste de toutes les régions activées dans votre compte. Choisissez la région la plus proche de votre lieu de travail :

Vous pouvez écrire la valeur de la région dans cette variable d'environnement :

```shell
AWS_STRATEGY_DEFAULT_REGION="xx-xxxx-x"
```

![aws_1](../../../../../img/aws_regions5.png)

### Créer un utilisateur

Nous devons d'abord créer un utilisateur à partir duquel nous générons les clés. Rechercher IAM :

![aws_1](../../../../../img/aws_1.png)

Cliquez sur Users: 

![aws_2](../../../../../img/aws_users.png)

![aws_2](../../../../../img/aws_adduser.png)

Vous devez suivre un processus de trois étapes:

1. Écrivez le nom de l'utilisateur

2. Définissez ses autorisations

![aws_4](../../../../../img/aws_4.png)

3. Enfin créer l'utilisateur.

![aws_rcreate_user](../../../../../img/aws_rcreate_user.png)

### Créer les clés d'accés et les clés secrets

Sélectionnez l'utilisateur créé puis cliquez sur "identifiants de sécurité" :

![aws_access](../../../../../img/aws_access.png)

On descend dans la page de l'utilisateur selectionné :

![aws_5](../../../../../img/aws_5.png)

Choisissez l'option Interface de ligne de commande (CLI), puis rédigez une description (facultatif). Enfin, créez la clé.

![aws_6](../../../../../img/aws_6.png)

Ensuite, vous pouvez obtenir votre clé d'accès et votre clé secrète afin de pouvoir les écrire dans ces variables d'environnement :

```shell
AWS_STRATEGY_ACCESS_KEY_ID="AKIxxxxxxxxxxxxxxxxx"
AWS_STRATEGY_SECRET_ACCESS_KEY="qvXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX"
```

![aws_7](../../../../../img/aws_7.png)

### Obtenir l'ID du sous-réseau

Tapez VPC dans la barre de recherche :

![aws_8](../../../../../img/aws_8_vpc.png)

Selectionnez le VPC que vous voulez utiliser :

![aws_sebnet1](../../../../../img/aws_subnets.png)

Vous pouvez trouver l'ID de sous-réseau pour chaque zone de disponibilité (a, b, c...) :

![aws_subnet2](../../../../../img/aws_vpc_hierarchy.png)

Vous choisissez les ID de sous-réseau en fonction de chaque zone de disponibilité. Vous pouvez écrire l'ID de sous-réseau dans le fichier yaml des environnements cloud :

```shell
- region: xx-xxxx-x
        zones:
          - name: "x"
            subnet: subnet-048XXXXXXXXXXXXXX
```

### Obtenir l'ID du groupe de securité

Dans la barre latérale gauche, choisissez Groupes de sécurité :

![aws_sg1](../../../../../img/aws_sg1.png)

Vous choisissez les ID de sous-réseau en fonction de chaque région et zone de disponibilité (a, b, c...). Vous pouvez écrire l'ID du groupe de sécurité dans le fichier yaml des environnements cloud :

![aws_9_sg_list2](../../../../../img/aws_9_sg_list2.png)

```shell
- region: xx-xxxx-x
        zones:
          - name: "x"
            subnet: subnet-048XXXXXXXXXXXXXX
            sg: sg-0266XXXXXXXXXXXXX    
```

### Obtenir l'ID de la zone DNS hebergée

Chercher "Route53" :

![aws_route53_1](../../../../../img/aws_route53_1.png)

Vous devez acheter un domaine afin d'obtenir automatiquement une zone hébergée :

![aws_route53_1](../../../../../img/aws_route53_2.png)

Vous pouvez écrire l'ID de la zone DNS hébergée du fichier yaml des environnements cloud :

```shell
dns_hosted_zone_id: Z08XXXXXXXXXXXXXXXXB 
```

![aws_route53_1](../../../../../img/aws_route53_3.png)
