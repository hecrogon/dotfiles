return {
  'mfussenegger/nvim-dap-python',
  ft = 'python',
  dependencies = {
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    -- expand to your real data dir, usually ~/.local/share/nvim
    local mason_home = vim.fn.stdpath('data') .. '/mason'
    local debugpy_python = mason_home .. '/packages/debugpy/venv/bin/python'

    require('dap-python').setup(debugpy_python)

    -- optional: try to load NvChad’s mapping helper if present
    local ok, utils = pcall(require, 'nvchad.utils')
    if ok and utils.load_mappings then
      utils.load_mappings('dap_python')
    end
  end,
}
