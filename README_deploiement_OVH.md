# Déploiement sur OVHcloud — skotazmodding.pro

Ce guide décrit pas-à-pas les actions que vous devez faire sur OVHcloud pour déployer le site contenu dans ce dossier.

1) Pré-requis
- Avoir un hébergement Web OVH (hébergement mutualisé) ou un VPS avec accès SFTP/SSH.
- Avoir vos identifiants OVH (espace client) et accès FTP/SFTP fournis par OVH.

2) Contenu préparé
- Fichiers déjà présents dans ce dossier : `accueil.html`, `Pack_EUP_Secours_Français v2.8.html`, `PS6G_BSPP.html`, `pack-eup.html`, `PS6G.html`, `index.html`, `.htaccess`.

3) Méthode recommandée — via le Manager OVH (interface web)
- Connectez-vous à votre espace client OVHcloud > Web Cloud > Hébergements.
- Sélectionnez votre nom de domaine `skotazmodding.pro` puis ouvrez l'onglet "FTP-SSH" ou "Multisite".
- Dans la section "FTP - Accès", notez l'hôte FTP, le nom d'utilisateur et le mot de passe.
- Ouvrez le gestionnaire de fichiers OVH (si disponible) ou utilisez un client FTP (FileZilla, WinSCP).

4) Upload des fichiers (via FileZilla / WinSCP / lftp)
- Hôte : l'adresse FTP indiquée par OVH (ex : ftp.clusterXXX.hosting.ovh.net)
- Utilisateur : votre identifiant FTP
- Mot de passe : votre mot de passe FTP
- Port : 21 (FTP) ou 22 (SFTP si activé)

Exemple avec `lftp` :
```bash
lftp -u FTP_USER,FTP_PASSWORD ftp.clusterXXXX.hosting.ovh.net
cd /www
mirror -R ./ /www
exit
```

Sur OVH mutualisé, le répertoire public est généralement `/www`. Placez tous les fichiers à la racine `/www`.

5) Configuration importante
- L'index par défaut est maintenant `accueil.html` (fichier `.htaccess` et `index.html` fournis) : aucune action supplémentaire nécessaire si OVH respecte `DirectoryIndex`.
- Si vos URLs propres ne fonctionnent pas, créez ou copiez le fichier `.htaccess` fourni à la racine `/www`.
- Vérifiez que `pack-eup.html` et `PS6G.html` sont présents — ils redirigent vers les pages complètes.

6) HTTPS / Certificat SSL
- Dans le Manager OVH > Hébergement > Certificat SSL : activez le SSL (Let's Encrypt) puis générez/renouvelez le certificat.
- Attendez quelques minutes puis testez `https://skotazmodding.pro/accueil`.

7) DNS (si hébergement séparé)
- Si vous avez un hébergement externe, pointez le domaine via les enregistrements A/AAAA vers l'IP de l'hébergeur.
- Si vous utilisez seulement l'hébergement OVH du domaine, aucune modification DNS n'est nécessaire.

8) Vérifications finales
- Ouvrez un navigateur et testez :
  - `https://skotazmodding.pro/accueil`
  - `https://skotazmodding.pro/pack-eup`
  - `https://skotazmodding.pro/PS6G`
- Commande de test rapide :
```bash
curl -I https://skotazmodding.pro/accueil
```

9) Ce que je n'ai pas pu faire à votre place
- Je ne peux pas accéder à votre compte OVH pour :
  - créer l'hébergement ou activer FTP/SFTP
  - uploader les fichiers depuis mon environnement
  - générer le certificat SSL pour votre domaine (action côté OVH)

Actions à faire par vous (résumé rapide)
1. Connectez-vous à OVHcloud > Hébergements > votre domaine.
2. Récupérez les identifiants FTP ou utilisez le gestionnaire de fichiers OVH.
3. Uploadez tous les fichiers de ce dossier vers `/www`.
4. Vérifiez que `.htaccess` et `index.html` sont présents.
5. Activez SSL (Let's Encrypt) depuis l'interface OVH.
6. Testez les URLs listées ci-dessus.

Si vous voulez, je peux rédiger des commandes FTP/SFTP personnalisées si vous me donnez le nom d'hôte FTP et le style d'accès (FTP vs SFTP). Ne partagez PAS vos identifiants ici : je vous donnerai la syntaxe à exécuter localement.
