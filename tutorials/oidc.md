# OIDC configurations

## How to Get Google Client ID and Client Secret for Google OIDC configuration

1. Go to Google Cloud Console (https://console.cloud.google.com)

![Google Console](../img/oidc/oidc_google.png)

2. Create a new project or select an existing one
   - Click on the project dropdown at the top
   - Click "New Project" or select existing
   - If creating new, enter name and click "Create"

![Create new google project](../img/oidc/oidc_google_1.png)

![Create new google project 2](../img/oidc/oidc_google_2.png)

3. Enable OAuth consent screen
   - Go to "APIs & Services" > "OAuth consent screen"
   - Choose "External" user type
   - Fill required fields (app name, user support email, developer contact)
   - Under "OAuth consent screen", add test users if you're in test mode to make specific users able to user the newly added OIDC feature.
   - Add authorized domains including your platform's domain
   - Enable required Google APIs (like userinfo.email, userinfo.profile, and openid) if needed
   - Save and continue

![OAuth consent screen](../img/oidc/oidc_google_4.png)

![OAuth consent screen](../img/oidc/oidc_google_5.png)

![OAuth consent screen](../img/oidc/oidc_google_6.png)

![OAuth consent screen](../img/oidc/oidc_google_7-1.png)

![OAuth consent screen](../img/oidc/oidc_google_7-2.png)

![OAuth consent screen](../img/oidc/oidc_google_8.png)

![OAuth consent screen](../img/oidc/oidc_google_9.png)

![OAuth consent screen](../img/oidc/oidc_google_10.png)

![OAuth consent screen](../img/oidc/oidc_google_11.png)

![OAuth consent screen](../img/oidc/oidc_google_12.png)

![OAuth consent screen](../img/oidc/oidc_google_13.png)

4. Configure OAuth credentials
   - Go to "APIs & Services" > "Credentials"
   - Click "Create Credentials" > "OAuth client ID"
   - Select "Web application" as application type
   - Add name for the OAuth client
   - Add any additional authorized JavaScript origins and redirect URIs as needed
   - Click "Create"

![Credentials](../img/oidc/oidc_google_14.png)

![Credentials](../img/oidc/oidc_google_15.png)

![Credentials](../img/oidc/oidc_google_16.png)

5. Get credentials
   - After creation, you'll see the Client ID and Client Secret
   - Client Secret is shown only once, so store it safely

![Credentials](../img/oidc/oidc_google_17.png)

