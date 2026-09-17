#!/usr/bin/env bash
set -e

# Resolve this directory (so it works even if run from elsewhere)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_CONFIG="$HOME/.config/nvim"

echo "→ Checking prerequisites..."
missing=()
for cmd in nvim git rg curl unzip cc tree-sitter uv python3 node npm; do
  command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
done
if [ ${#missing[@]} -gt 0 ]; then
  echo "✗ Missing: ${missing[*]}"
  echo "  Install with: sudo pacman -S neovim git ripgrep curl unzip base-devel tree-sitter-cli uv python nodejs npm"
  exit 1
fi

if [ -e "$NVIM_CONFIG" ]; then
  echo "✗ $NVIM_CONFIG already exists. Move it aside first (e.g. mv it to nvim.bak), then re-run."
  exit 1
fi

echo "→ Cloning NvChad starter to $NVIM_CONFIG..."
git clone --depth 1 https://github.com/NvChad/starter "$NVIM_CONFIG"

echo "→ Overlaying custom config..."
cp "$REPO_DIR/lua/mappings.lua" "$NVIM_CONFIG/lua/mappings.lua"
cp "$REPO_DIR/lua/configs/lspconfig.lua" "$NVIM_CONFIG/lua/configs/lspconfig.lua"
cp "$REPO_DIR/.stylua.toml" "$NVIM_CONFIG/.stylua.toml"
cp "$REPO_DIR"/lua/plugins/*.lua "$NVIM_CONFIG/lua/plugins/"
cp "$REPO_DIR/lazy-lock.json" "$NVIM_CONFIG/lazy-lock.json"

echo "→ Installing plugins..."
nvim --headless "+Lazy! sync" +qa

echo "→ Installing Mason tools (LSP servers, linters, debuggers)..."
nvim --headless -c "lua
  require('lazy').load({ plugins = { 'mason.nvim' } })
  require('mason-tool-installer').check_install(false, true)
" +qa

echo "→ Compiling treesitter parsers (this can take a minute)..."
nvim --headless -c "lua
  require('nvim-treesitter').install(
    {'lua','luadoc','printf','vim','vimdoc','python','html','css','markdown','markdown_inline','c'},
    {force = true}
  ):wait(300000)
" +qa

echo "✅ NvChad installed successfully!"
echo "  Note: nvim-dap-retro drives ZEsarUX/VICE/MAME — install the emulators you need separately."
echo "  Note: the Obsidian notes vault expects ~/pCloudDrive/notes/vault — set up pCloud sync separately if needed."
