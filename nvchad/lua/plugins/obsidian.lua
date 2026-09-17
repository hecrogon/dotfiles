return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "markdown",
      callback = function()
        vim.wo.conceallevel = 2
      end,
    })
  end,
  opts = {
    legacy_commands = false,
    workspaces = {
      {
        name = "personal",
        path = "~/pCloudDrive/notes/vault",
      },
    },
    -- render-markdown.nvim now owns visual rendering (checkboxes, headings,
    -- concealed markup) to avoid both plugins drawing the same things twice.
    ui = { enable = false },
  },
}
