# Configurations OIDC

## Comment obtenir l'ID Client et le Secret Client Google pour la configuration OIDC Google

1. Accédez à la Console Google Cloud (https://console.cloud.google.com)

![Console Google](../../../img/oidc/oidc_google.png)

2. Créez un nouveau projet ou sélectionnez un projet existant
   - Cliquez sur la liste déroulante du projet en haut
   - Cliquez sur "Nouveau Projet" ou sélectionnez un existant
   - Si vous créez un nouveau, entrez le nom et cliquez sur "Créer"

![Créer nouveau projet google](../../../img/oidc/oidc_google_1.png)

![Créer nouveau projet google 2](../../../img/oidc/oidc_google_2.png)

3. Activez l'écran de consentement OAuth
   - Allez dans "APIs & Services" > "Écran de consentement OAuth"
   - Choisissez le type d'utilisateur "Externe"
   - Remplissez les champs requis (nom de l'application, email de support utilisateur, contact développeur)
   - Sous "Écran de consentement OAuth", ajoutez des utilisateurs test si vous êtes en mode test pour permettre à des utilisateurs spécifiques d'utiliser la nouvelle fonctionnalité OIDC.
   - Ajoutez les domaines autorisés incluant le domaine de votre plateforme
   - Activez les APIs Google requises (comme userinfo.email, userinfo.profile, et openid) si nécessaire
   - Sauvegardez et continuez

![Écran de consentement OAuth](../../../img/oidc/oidc_google_4.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_5.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_6.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_7-1.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_7-2.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_8.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_9.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_10.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_11.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_12.png)

![Écran de consentement OAuth](../../../img/oidc/oidc_google_13.png)

4. Configurez les identifiants OAuth
   - Allez dans "APIs & Services" > "Identifiants"
   - Cliquez sur "Créer des identifiants" > "ID Client OAuth"
   - Sélectionnez "Application Web" comme type d'application
   - Ajoutez un nom pour le client OAuth
   - Ajoutez les origines JavaScript autorisées et les URIs de redirection si nécessaire
   - Cliquez sur "Créer"

![Identifiants](../../../img/oidc/oidc_google_14.png)

![Identifiants](../../../img/oidc/oidc_google_15.png)

![Identifiants](../../../img/oidc/oidc_google_16.png)

5. Obtenez les identifiants
   - Après la création, vous verrez l'ID Client et le Secret Client
   - Le Secret Client n'est montré qu'une seule fois, stockez-le en sécurité

![Identifiants](../../../img/oidc/oidc_google_17.png)

