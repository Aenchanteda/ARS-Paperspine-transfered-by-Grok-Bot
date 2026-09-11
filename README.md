# ARS + PaperSpine transfer (Codex ↔ Git ↔ Grok)

**Private academic toolkit mirror.** Keep this repository **private**.

Upstream licenses still apply (notably ARS **CC BY-NC**). This repo is for your own non-commercial scholarly reuse and sync — not for public redistribution of the vendored suite.

## Layout

| Path | Role |
|---|---|
| `ars-codex/` | Mirror of `~/.codex/skills/academic-research-suite` (ARS-Codex adapter + vendored `ars/`) |
| `paper-spine/` | Mirror of `~/.codex/skills/paper-spine` |
| `scripts/sync-from-codex.sh` | Codex install → update this git tree |
| `scripts/sync-to-codex.sh` | This git tree → reinstall Codex skills |
| `scripts/sync-to-grok.sh` | This git tree → Grok box checkout cache |
| `grok-adapters/` | Notes / thin adapters for Grok Bot |
| `AGENTS.codex.md` | Copy of Codex working preferences |

## Source of truth

1. Edit / upgrade on Codex when that is convenient.
2. Run `./scripts/sync-from-codex.sh`, then `git commit` + `git push`.
3. On Grok’s computer: `git pull` (or `./scripts/sync-to-grok.sh` from a checkout) so adapters see the same files.
4. On a new Mac: `git clone` + `./scripts/sync-to-codex.sh`.

## Reuse later

```bash
git clone git@github.com:Aenchanteda/ARS-Paperspine-transfered-by-Grok-Bot.git
cd ARS-Paperspine-transfered-by-Grok-Bot
./scripts/sync-to-codex.sh          # restore Codex
# or on Grok box:
./scripts/sync-to-grok.sh           # refresh /workspace/paper-ops/codex-mirror
```

Grok should execute stages by reading files under the checkout, not by “remembering” documentation.
