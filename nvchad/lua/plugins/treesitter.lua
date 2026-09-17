return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    vim.list_extend(opts.ensure_installed, { "python", "html", "css", "markdown", "markdown_inline", "c" })
    return opts
  end,
}
