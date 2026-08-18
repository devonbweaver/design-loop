#!/usr/bin/env bash
# Symlink this repo into ~/.claude/skills/design-loop so Claude Code picks it up.
set -euo pipefail
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="${HOME}/.claude/skills/design-loop"
mkdir -p "${HOME}/.claude/skills"
if [ -e "$DEST" ] && [ ! -L "$DEST" ]; then
  echo "✗ $DEST exists and is not a symlink. Move it aside, then re-run." >&2
  exit 1
fi
ln -sfn "$SRC" "$DEST"
echo "✓ Linked $DEST -> $SRC"
echo "  Restart Claude Code, then run: /design-loop"
