# NvChad config

Personal NvChad setup: `install.sh` clones a fresh `NvChad/starter` into `~/.config/nvim`
and overlays the custom files in this directory on top of it.

## Requirements

Assumes Arch Linux (pacman). On another distro, install the equivalent packages.

```sh
sudo pacman -S neovim git ripgrep curl unzip base-devel tree-sitter-cli uv python nodejs npm
```

- `neovim` — obviously.
- `git` — clones NvChad, plugins, and `nvim-dap-retro`.
- `ripgrep` (`rg`) — used by Telescope's live grep.
- `curl` — Mason downloads every tool with it.
- `unzip`, `base-devel` (provides `cc`/`gcc`) — some plugins still shell out to a C compiler.
- `tree-sitter-cli` — required by `nvim-treesitter` to compile parsers. Without it, every
  parser install fails with `ENOENT: ... 'tree-sitter'`. Install via pacman, not
  `cargo install`/`npm i -g` — pacman keeps it updated with the rest of the system.
- `python` (`python3`) — Mason builds `debugpy`/`mypy`/`ruff` in a venv, and the
  `nvim-dap-retro` adapters spawn `python3` directly to talk to the emulators.
- `nodejs`/`npm` — `pyright` is an npm package and its language server is a node
  script, so node is needed at runtime, not just to install it.
- `uv` — not needed by Neovim itself, but used for per-project Python venvs (see the
  Docker-repo notes in the vault's `nvchad-setup.md`).

`install.sh` checks for all of the above and tells you the exact command if anything's
missing, rather than trying to install system packages itself.

### Not checked by the script

- **A Nerd Font** in your terminal — NvChad's UI icons need one, can't be verified from a
  shell script.
- **pCloud sync** for the Obsidian notes vault — `obsidian.nvim` expects
  `~/pCloudDrive/notes/vault` to exist. Not installed by this script; set up pCloud
  separately. The plugin loads fine without it, the vault just won't have content until
  the sync catches up.
- **Codeium auth** — `:Codeium Auth` once, after first launch, if you want AI completion.
  (The plugin is now `Exafunction/windsurf.vim` after the upstream rename; the commands
  and the `codeium#*` API kept their old names.)

## Usage

```sh
~/.dotfiles/nvchad/install.sh
```

Aborts if `~/.config/nvim` already exists — move it aside first (e.g. `mv ~/.config/nvim
~/.config/nvim.bak`) if you're redoing this on a machine that already has one.

## What gets installed automatically

- All plugins (`:Lazy sync`, run non-interactively by the script)
- Mason tools: `debugpy`, `stylua`, `pyright`, `mypy`, `ruff`, `clangd`
- Treesitter parsers: `lua`, `luadoc`, `printf`, `vim`, `vimdoc`, `python`, `html`, `css`,
  `markdown`, `markdown_inline`, `c`

If you add a language to `lua/plugins/treesitter.lua`'s `ensure_installed`, remember to add
it to `install.sh`'s hardcoded parser list too — it can't dynamically resolve the plugin's
`opts` function at install time (see the comment in `install.sh` for why).

## Full reference

For the complete history of *why* each piece is set up this way (gotchas hit, bugs fixed,
version-pinning decisions), see the `nvchad-setup.md` note in the Obsidian vault at
`~/pCloudDrive/notes/vault/Professional/Development/nvchad-setup.md`.
