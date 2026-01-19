return {
  "nvim-lua/null-ls.nvim",
  dependencies = { "jay-babu/mason-null-ls.nvim", "williamboman/mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    local is_termux = vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil

    local sources = {
      null_ls.builtins.diagnostics.pylint.with({
        condition = function(utils)
          return utils.root_has_file(".pylintrc") or utils.root_has_file("pyproject.toml")
        end,
      }),
      null_ls.builtins.diagnostics.eslint_d.with({
        condition = function(utils)
          return utils.root_has_file(".eslintrc") or utils.root_has_file("package.json")
        end,
      }),
      null_ls.builtins.diagnostics.luacheck.with({
        condition = function(utils)
          return utils.root_has_file(".luacheckrc")
        end,
      }),
      null_ls.builtins.diagnostics.markdownlint.with({
        condition = function(utils)
          return utils.root_has_file(".markdownlint.json")
        end,
      }),
      null_ls.builtins.diagnostics.yamllint.with({
        condition = function(utils)
          return utils.root_has_file(".yamllint") or utils.root_has_file(".yamllint.yml")
        end,
      }),
    }

    null_ls.setup({
      sources = sources,
      debug = false,
    })
  end,
}
