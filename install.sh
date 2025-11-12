#!/usr/bin/env bash
set -e

# Resolve repo directory (even if script is run from outside)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# List of files to link (add more as needed)
FILES=(
  ".zshrc"
  ".tmux.conf"
)

# Backup existing files and create symlinks
for file in "${FILES[@]}"; do
  target="$HOME/$file"
  source="$REPO_DIR/$file"

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
