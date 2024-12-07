# Conditions générales d'utilisation

Ces conditions générales d'utilisations concernent la [version SaaS de CWCloud](https://cloud.comwork.io).

## Traductions

Cette page est également disponible dans les langues suivantes :
* [English 🇬🇧](../../terms.md)

## Par qui et où est hébergé ce service ?

Cette instance est hébergée en France par [COMWORKIO SASU](https://www.comwork.io) (R.C.S Paris 838 757 987) sur le cloud provider [Scaleway](https://www.scaleway.com).

## Pour quel(le)s client(e)s est fournis ce service ?

Cette instance est disponible pour tous le monde ayant la capacité de payer en ligne en euros. Pour les citoyens de l'unition européenne, la TVA française de 20% est appliquée.

Pour les clients basées en Tunisie qui ne peuvent payer qu'en dinars tunisiens (TND) en ligne, il existe un service équivalent qui propose la même chose ici: [cwcloud.tn](https://cwcloud.tn) avec ces [conditions générales d'utilisation](https://doc.cwcloud.tn/docs/terms)

## Quels sont les prix et modèles d'instances disponibles ?

Vous trouverez tous les détails sur le prix et modèles d'instances [ici](../../sizing_pricing.md).

## Comment fonctionne le paiement sécurisé ?

Les factures sont générées mensuellement et doivent être réglée dans une fenêtre de temps de 48h, vous pouvez trouver comment télécharger et régler vos factures avec [ce tutoriel](./tutorials/console/public/billing.md).

Le système de paiement utilise [stripe](https://www.stripe.com) pour les paiements sécurisés.

Vous n'êtes pas obligé de l'utiliser, vous pouvez faire des virements à la société COMWORKIO SASU (vous pouvez nous demander un RIB ou IBAN via le [système de support](./tutorials/console/public/support.md)).

## Quelles sont les licences des composants ?

Toutes les licences sont détaillées [ici](../../licences.md).

## Quelles sont les informations que nous collectons ?

* _Informations basiques de compte utilisateur_: Si vous vous inscrivez, vous serez probablement amenés à entrer une adresse email et un mot de passe. Vous pourrez également compléter votre profil avec d'autres informations comme les références de votre société, vos moyens de paiements (cartes bancaires) afin de pouvoir être facturé. Ces informations ne sont accessibles qu'au personnel de COMWORKIO.

* _Adresses IPs et autres metadonnées_: Quand vous vous authentifiez, nous enregistrons votre adresse IP et d'autres informations de navigation comme le navigateur que vous utilisez, etc. Ces logs de sessions sont stockées à des fins de debogages pour une durée de 12 mois. Nous retenons aussi les adresses IPs associées à chaque requêtes dans les logs de nos serveurs.

## Pour quelles raisons conservons-nous ces données ?

Les informations que nous collectons sont utilisées de la façon suivante :

* L'adresse email et les informations de votre profiles sont utilisées pour générer et vous envoyer automatiquement les factures mais aussi vous faire des annonces ou des mails de confirmations pour générer un nouveau mot de passe
* Les moyens de paiements, qui ne sont pas obligatoires, pour vous faciliter les paiements en ligne

## Quelle est notre politique de rétention ?

Nous faisont en sorte de :

* Concerver les logs des serveurs qui contiennent les adresses IPs de chaque requête pour une durée maximale de 90 jours.
* Les adresses IPs enregistrées par les utilisateurs pour une durée de 12 mois.

## Utilisons-nous des cookies ?

Oui. Les cookies sont de petits fichiers qu'un site envoie sur votre navigateur si vous l'autorisez. Ces cookies permettent de reconnaître votre profil d'utilisateur notamment le type de navigateur ou d'appareil que vous utilisez ou de conserver en local des choix de paramètres que vous feriez comme la langue ou le thème graphique (sombre ou clair).

Ces cookies nous permettent de comprendre et sauvegarder vos préférences pour vos futures visites.

## Divulguons-nous des informations à des tiers ?

Nous ne vendons, n’échangeons ni ne transférons à des tiers vos informations personnelles identifiables. Cela n'inclut pas les tiers de confiance qui nous aident à exploiter notre site, à mener nos activités ou à vous servir, à condition que ces parties acceptent de garder ces informations confidentielles. Nous pouvons également divulguer vos informations lorsque nous pensons que cette divulgation est appropriée pour nous conformer à la loi, appliquer les politiques de notre site ou protéger nos droits, notre propriété ou notre sécurité ou ceux d'autrui.

## Quelles sont les tiers (3rd parts) utilisés ?

Notre console web utilise des fichiers statiques en provenance de services tiers. Elles viennent de [stripe](https://stripe.com) dans le but de fournir des composants graphiques qui permettent de retenir facilement vos moyens de paiements de façon sécurisés, et également de [font-awesome](https://fontawesome.com) pour des icônes et polices.

Voici ce que vous pourrez observer avec uMatrix :

![umatrix](../../img/umatrix.png)

Ces fichiers statiques sont hébergées aux états-unis et nous préférons que vous le sachiez car ils sont capables de retenir également des informations telles que votre adresses IP dans un pays qui ne suit pas les mêmes lois que les états membres de l'union européenne, même pour les société qui prétendent être en conformité avec la RGPD[^1].

Egalement la zone DNS `comwork.click` est managée par [Cloudflare](https://www.cloudflare.com) donc si vous l'utilisez pour exposer vos services, nous vous informons qu'ils seront également capables d'accéder à votre adresse IP.

Et pour finir voici les hébergeurs disponibles pour le déploiement de vos instances, registry et object storages :
* [Scaleway](https://www.scaleway.com)
* [OVH](https://www.ovhcloud.com)

Vous serez en mesure de choisir l'hébergeur et la région à chaque fois que vous serez amener à créer une ressource cloud parmi celles citées juste au dessus.

## Quels sont les types de services interdits ?

Ces types de services sont interdits :

* Services illégaux au regard des lois des états membres de l'Union Européenne
* Service de minage de crypto-monnaies[^2]
* Contenu pornographique
* Discours de haine et harcèlement

## Quel est l'âge minimum requis ?

La [version SaaS de cwcloud](https://cloud.comwork.io) est hébergée en Union Européenne: nos services sont donc adressés aux personnes agées de 16 ans ou plus. Si vous avez moins de 16 ans, conformément au RGPD[^1], vous ne devez pas utiliser ce site.

## Quelles sont les conditions d'arrêt d'hébergement

* Si les factures ne sont pas réglées après 10 jours de leur émission, les services seront coupés puis définitivement supprimés après 5 jours supplémentaires
* Toutes les factures dues à la société [COMWORKIO SASU](https://www.comwork.io) (R.C.S Paris 838 757 987) ou bien à ses partenaires (voir la liste des partenaires ci-dessous) peuvent justifier une interruption de ces services.

### Liste des partenaires

* COMWORKER (M.F: 1605574/E), une filliale tunisienne qui propose le service [cwcloud.tn](https://www.cwcloud.tn)

[^1]: [Règlement Général sur la Protection des Données](https://fr.wikipedia.org/wiki/R%C3%A8glement_g%C3%A9n%C3%A9ral_sur_la_protection_des_donn%C3%A9es)
[^2]: il n'est pas interdit d'héberger des sites webs ou API reliées à un service de crypto-monnaie, il est simplement interdit de miner de la crypto sur nos serveurs et stockages (car c'est interdit par les hébergeurs sur lesquels nous reposons)
