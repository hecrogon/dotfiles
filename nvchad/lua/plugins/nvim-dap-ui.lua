return {
  "rcarriga/nvim-dap-ui",
  dependencies = { "mfussenegger/nvim-dap" },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    -- dapui.setup() is called by nvim-dap-retro, which owns the layout config
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end

    vim.fn.sign_define("DapBreakpoint",{ text ="🟥", texthl ="", linehl ="", numhl =""})
    vim.fn.sign_define("DapStopped",{ text ="▶️", texthl ="", linehl ="", numhl =""})
  end
}
