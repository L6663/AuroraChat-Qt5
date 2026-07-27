# Source Sync Status

## Current state

The managed implementation has reached `v1.4.2-alpha-emoji-render-fix` and passed Qt 5.4 client/server compilation plus a two-client private text and PNG-token emoji verification.

The repository documentation, roadmap, validation status and Issues are synchronized. The complete managed source directory is ready for the one-time initial native Git import.

## Why one native Git import is still required

The connected GitHub action supports repository text-file updates, branches, refs, Issues and pull requests, but it does not accept a local project directory as one atomic upload. Importing more than one hundred source/resource files one by one would create an inaccurate and fragmented baseline.

## One-time import from the v1.4.2 project root

```bash
git init
git branch -M main
git remote add origin https://github.com/L6663/AuroraChat-Qt5.git
git pull origin main --allow-unrelated-histories
git add .
git commit -m "feat: import Aurora Chat v1.4.2 source baseline"
git push -u origin main
git branch develop
git push -u origin develop
```

When resolving the one-time merge, retain the repository's current `README.md`, `LICENSE`, `.gitignore` and `docs/` changes where they are newer than the local copy.

After the source import, ongoing development uses normal `develop`, `feature/*`, commits, Issues and pull requests.
