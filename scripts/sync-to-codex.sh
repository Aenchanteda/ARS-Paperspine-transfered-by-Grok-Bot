#!/usr/bin/env bash
# This git repo → ~/.codex/skills (reinstall / update local Codex)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ARS_DST="${CODEX_ARS_DST:-$HOME/.codex/skills/academic-research-suite}"
PS_DST="${CODEX_PS_DST:-$HOME/.codex/skills/paper-spine}"

mkdir -p "$(dirname "$ARS_DST")" "$(dirname "$PS_DST")"

rsync -a --delete \
  --exclude '.DS_Store' --exclude '**/.DS_Store' \
  --exclude '**/__pycache__/' --exclude '**/*.pyc' \
  "$ROOT/ars-codex/" "$ARS_DST/"

rsync -a --delete \
  --exclude '.DS_Store' --exclude '**/.DS_Store' \
  --exclude '**/__pycache__/' --exclude '**/*.pyc' \
  "$ROOT/paper-spine/" "$PS_DST/"

echo "synced repo → Codex skills"
echo "  $ARS_DST"
echo "  $PS_DST"
echo "restart/reload Codex if skills were already loaded"
