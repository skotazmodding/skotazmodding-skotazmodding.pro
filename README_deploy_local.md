Déploiement local vers GitHub Pages

1) Prérequis
- Git installé localement
- Avoir un compte GitHub et avoir créé le dépôt : https://github.com/skotazmodding/skotazmodding-skotazmodding.pro

2) Déploiement (Windows PowerShell)
```powershell
cd "C:\Users\Admin\Desktop\Site skotazmodding.pro"
.
\deploy-windows.ps1
```

3) Déploiement (Linux / macOS / WSL)
```bash
cd "C:/Users/Admin/Desktop/Site skotazmodding.pro"
bash deploy.sh
```

4) Après push
- Allez sur GitHub → votre repo → Settings → Pages
- Choisissez la source : `main` branch, folder: `/ (root)`
- Ajoutez le domaine personnalisé `skotazmodding.pro` si nécessaire (le fichier `CNAME` est déjà présent)
- Activez `Enforce HTTPS` une fois que GitHub a validé le certificat.
