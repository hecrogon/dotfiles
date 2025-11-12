#!/usr/bin/env bash
set -e

# Resolve the repo path (so it works even if run from elsewhere)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Files in repo (without dots)
FILES=(
  "zshrc"
  "tmux.conf"
)

for file in "${FILES[@]}"; do
  source="$REPO_DIR/$file"
  target="$HOME/.$file"

  if [ -L "$target" ]; then
    echo "→ Removing old symlink: $target"
    rm "$target"
  elif [ -f "$target" ]; then
    echo "→ Backing up existing file: $target → ${target}.bak"
    mv "$target" "${target}.bak"
  fi

  echo "→ Linking $source → $target"
  ln -s "$source" "$target"
done

echo "✅ Dotfiles installed successfully!"
