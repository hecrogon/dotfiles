-- load NvChad defaults
require "nvchad.mappings"

-- add yours below
local map = vim.keymap.set

-- basic
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Codium
map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["codeium#Accept"](), "")
end, { desc = "Codium Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- DAP
map("n", "<leader>db", function() require("dap").toggle_breakpoint() end, { desc = "DAP Toggle Breakpoint" })
map("n", "<leader>dc", function() require("dap").continue() end, { desc = "DAP Continue" })
map("n", "<leader>dov", function() require("dap").step_over() end, { desc = "DAP Step Over" })
map("n", "<leader>di", function() require("dap").step_into() end, { desc = "DAP Step Into" })
map("n", "<leader>dou", function() require("dap").step_out() end, { desc = "DAP Step Out" })

-- DAP Python
map("n", "<leader>dpr", function() require("dap-python").test_method() end, { desc = "DAP Python Test" })

-- DAP Retro
map("n", "<leader>dzr", function() require("nvim-dap-retro").debug() end, { desc = "DAP Retro Debug" })

-- Obsidian
map("n", "<leader>oo", "<cmd>Obsidian quick_switch<cr>", { desc = "Obsidian Quick Switch" })
map("n", "<leader>os", "<cmd>Obsidian search<cr>", { desc = "Obsidian Search" })
map("n", "<leader>ob", "<cmd>Obsidian backlinks<cr>", { desc = "Obsidian Backlinks" })
map("n", "<leader>on", "<cmd>Obsidian new<cr>", { desc = "Obsidian New Note" })
map("n", "<leader>ol", "<cmd>Obsidian follow_link<cr>", { desc = "Obsidian Follow Link" })
map("n", "<leader>oh", "<cmd>e ~/pCloudDrive/notes/vault/home.md<cr>", { desc = "Obsidian Open Home" })

-- Git Fugitive
map("n", "<leader>gs", "<cmd>Git<cr>", { desc = "Git Status" })
map("n", "<leader>gd", "<cmd>Gdiffsplit<cr>", { desc = "Git Diff" })
map("n", "<leader>gc", "<cmd>Git commit<cr>", { desc = "Git Commit" })
map("n", "<leader>gp", "<cmd>Git push<cr>", { desc = "Git Push" })
map("n", "<leader>gl", "<cmd>Git pull<cr>", { desc = "Git Pull" })
map("n", "<leader>gB", "<cmd>Git blame<cr>", { desc = "Git Blame" })
map("n", "<leader>go", "<cmd>Git log<cr>", { desc = "Git Log" })
map("n", "<leader>gf", "<cmd>Git log -p --follow -- %<cr>", { desc = "Git Log with diffs (current file)" })
map("n", "<leader>gh", "<cmd>Git show<cr>", { desc = "Git Show" })
map("n", "<leader>gw", "<cmd>Gwrite<cr>", { desc = "Git Write (stage current file)" })
map("n", "<leader>gr", "<cmd>Gread<cr>", { desc = "Git Read (checkout current file)" })
