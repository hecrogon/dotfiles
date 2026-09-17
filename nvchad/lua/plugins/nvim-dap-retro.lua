return {
  {
    "hecrogon/nvim-dap-retro",
    lazy = false,
    config = function()
      local retro = require('nvim-dap-retro')
      retro.setup({})
      require('dapui').setup({ layouts = retro.dapui_layout })
    end,
  },
}
