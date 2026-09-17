return {
  "kylechui/nvim-surround",
  version = "*",
  event = "VeryLazy",
  init = function()
    -- default visual-mode key is "S", which collides with flash.nvim's
    -- treesitter jump; disable it and rebind to gs/gS instead (v4 API:
    -- setup() no longer takes a `keymaps` table, see :h nvim-surround.keymaps).
    vim.g.nvim_surround_no_visual_mappings = true
  end,
  config = function()
    require("nvim-surround").setup({})
    vim.keymap.set("x", "gs", "<Plug>(nvim-surround-visual)", { desc = "Surround Visual" })
    vim.keymap.set("x", "gS", "<Plug>(nvim-surround-visual-line)", { desc = "Surround Visual Line" })
  end,
}
