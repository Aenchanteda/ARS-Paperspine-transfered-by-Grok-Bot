#!/usr/bin/env bash
# Codex ~/.codex/skills → this git repo (source of truth update)
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
ARS_SRC="${CODEX_ARS_SRC:-$HOME/.codex/skills/academic-research-suite}"
PS_SRC="${CODEX_PS_SRC:-$HOME/.codex/skills/paper-spine}"

for src in "$ARS_SRC" "$PS_SRC"; do
  if [[ ! -d "$src" ]]; then
    echo "missing source: $src" >&2
    exit 1
  fi
done

rsync -a --delete \
  --exclude '.DS_Store' --exclude '**/.DS_Store' \
  --exclude '**/__pycache__/' --exclude '**/*.pyc' \
  "$ARS_SRC/" "$ROOT/ars-codex/"

rsync -a --delete \
  --exclude '.DS_Store' --exclude '**/.DS_Store' \
  --exclude '**/__pycache__/' --exclude '**/*.pyc' \
  "$PS_SRC/" "$ROOT/paper-spine/"

if [[ -f "$HOME/.codex/AGENTS.md" ]]; then
  cp "$HOME/.codex/AGENTS.md" "$ROOT/AGENTS.codex.md"
fi

echo "synced Codex → repo at $ROOT"
echo "next: git status && git add -A && git commit && git push"
