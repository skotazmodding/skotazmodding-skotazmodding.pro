#!/usr/bin/env bash
set -e

# Deployment script for GitHub Pages
# Usage: run this in the site folder locally. It will init a git repo and push to GitHub.

REPO="https://github.com/skotazmodding/skotazmodding-skotazmodding.pro.git"
BRANCH="main"

if ! command -v git >/dev/null 2>&1; then
  echo "git is required. Install git and retry." >&2
  exit 1
fi

echo "Creating/ensuring CNAME..."
echo "skotazmodding.pro" > CNAME

if [ ! -d .git ]; then
  git init
fi

git checkout -B "$BRANCH"
git add .
git commit -m "Deploy site to GitHub Pages" || true

if git remote get-url origin >/dev/null 2>&1; then
  echo "Remote 'origin' exists, updating URL if needed."
  git remote set-url origin "$REPO"
else
  git remote add origin "$REPO"
fi

echo "Pushing to $REPO (branch $BRANCH). You will be asked for credentials if needed."
git push -u origin "$BRANCH" --force

echo "Deployed. Now enable GitHub Pages in your repository Settings → Pages, source: main / (root)."
