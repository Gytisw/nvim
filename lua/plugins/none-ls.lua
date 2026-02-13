return {
  "nvim-lua/null-ls.nvim",
  dependencies = { "jay-babu/mason-null-ls.nvim", "williamboman/mason.nvim" },
  config = function()
    local null_ls = require("null-ls")

    -- Detect Android (Termux/proot-distro) for platform-specific null-ls configuration
    local function is_android()
      -- Check kernel name for "Android" which works in both Termux and proot-distro
      local kernel = vim.fn.system({ "uname", "-s" }):gsub("%s+", "")
      if kernel:match("Linux") then
        -- On Linux, check if we're running on Android kernel
        local release = vim.fn.system({ "uname", "-r" }):gsub("%s+", "")
        -- Try multiple detection methods for proot-distro compatibility
        return (
          -- Method 1: Check kernel release (Android kernels often have -android suffix)
          release:match("android") or
          -- Method 2: Check PREFIX env var (native Termux)
          (vim.env.PREFIX and vim.env.PREFIX:find("termux") ~= nil) or
          -- Method 3: Check for Android property command (works in proot-distro)
          (vim.fn.executable("getprop") == 1 and vim.fn.system("getprop ro.build.version.sdk"):gsub("%s+", "") ~= "")
        )
      end
      return false
    end
    local is_termux = is_android()

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
