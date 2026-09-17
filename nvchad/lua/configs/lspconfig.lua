local lspconfig = require("nvchad.configs.lspconfig")
lspconfig.defaults()

-- defaults() already applies capabilities + on_init through vim.lsp.config("*")
-- and runs nvchad's on_attach from a global LspAttach autocmd, so servers that
-- need no extra settings only have to be enabled.
local servers = { "html", "cssls", "pyright", "clangd" }
vim.lsp.enable(servers)

-- ruff: lint/quick-fixes only, let pyright own hover to avoid duplicate popups
vim.lsp.config("ruff", {
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
})
vim.lsp.enable "ruff"

-- read :h vim.lsp.config for changing options of lsp servers
