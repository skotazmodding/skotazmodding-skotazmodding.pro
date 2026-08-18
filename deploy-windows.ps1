Param(
    [string]$RepoUrl = "https://github.com/skotazmodding/skotazmodding-skotazmodding.pro.git",
    [string]$Branch = "main"
)

if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Error "git n'est pas installé. Installez Git et relancez le script."
    exit 1
}

"Ecriture du fichier CNAME..."
"skotazmodding.pro" | Out-File -Encoding utf8 CNAME

if (-not (Test-Path .git)) {
    git init
}

git checkout -B $Branch
git add .
try { git commit -m "Deploy site to GitHub Pages" } catch {}

try {
    git remote get-url origin | Out-Null
    git remote set-url origin $RepoUrl
} catch {
    git remote add origin $RepoUrl
}

Write-Host "Pushing to $RepoUrl (branch $Branch). You may be prompted for credentials."
git push -u origin $Branch --force

Write-Host "Déploiement terminé. Activez GitHub Pages dans Settings → Pages, source: main / (root)."
