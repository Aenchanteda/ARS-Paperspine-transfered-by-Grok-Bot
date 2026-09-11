#!/usr/bin/env bash
# This git repo → Grok Bot shared computer checkout (cache, not source of truth)
# Run ON the Grok box (or from a machine that can write the checkout path).
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DEST="${GROK_CHECKOUT:-/workspace/paper-ops/codex-mirror}"

mkdir -p "$DEST"
rsync -a --delete \
  --exclude '.git/' \
  --exclude '.DS_Store' --exclude '**/.DS_Store' \
  --exclude '**/__pycache__/' --exclude '**/*.pyc' \
  --exclude 'paper_rewriting_output/' \
  "$ROOT/" "$DEST/"

echo "synced repo → Grok checkout cache: $DEST"
echo "Grok adapters must Read playbooks under $DEST/ars-codex and $DEST/paper-spine"
