return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      python = { "mypy" },
    }

    local function run_lint()
      local root = vim.fs.root(0, { "pyproject.toml", "mypy.ini", "setup.cfg" })
      lint.try_lint(nil, { cwd = root })
    end

    -- mypy is slow, so keep it off the hot path: python buffers only, and on
    -- read/write rather than InsertLeave (which type-checked on every <Esc>).
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost" }, {
      pattern = "*.py",
      callback = run_lint,
    })

    -- the buffer that triggered the load already fired BufReadPost
    if vim.bo.filetype == "python" then
      vim.schedule(run_lint)
    end
  end,
}
