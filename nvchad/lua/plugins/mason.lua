return {
  -- must match the repo NvChad declares (mason-org, not the old williamboman
  -- path) or lazy sees two different urls for one plugin name
  "mason-org/mason.nvim",
  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function(_, opts)
    require("mason").setup(opts)
    require("mason-tool-installer").setup({
      ensure_installed = {
        "debugpy",
        "stylua",
        "pyright",
        "mypy",
        "ruff",
        "clangd",
      },
    })
  end,
}
