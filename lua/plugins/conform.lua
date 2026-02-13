return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>cf",
      function()
        require("conform").format({ lsp_fallback = true, async = false, timeout_ms = 500 })
      end,
      mode = { "n", "v" },
      desc = "Format buffer",
    },
  },
  config = function()
    -- Detect Android (Termux/proot-distro) for conditional formatting
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

    local formatters_by_ft = {
      lua = { "stylua" },
      python = { "black", "isort" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      jsonc = { "prettierd", "prettier" },
      yaml = { "yamlfmt" },
      markdown = { "markdownlint-cli2", "markdown-toc" },
      bash = { "shfmt" },
      fish = { "fish_indent" },
      rust = { "rustfmt" },
      go = { "gofmt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
      cs = { "csharpier" },
      css = { "prettierd", "prettier" },
      scss = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      svelte = { "prettierd", "prettier" },
      graphql = { "prettierd", "prettier" },
      toml = { "taplo" },
    }

    -- On Termux, use fewer formatters to save resources
    if is_termux then
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        json = { "prettier" },
        bash = { "shfmt" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        c = { "clang_format" },
        cpp = { "clang_format" },
        css = { "prettier" },
        html = { "prettier" },
      }
    end

    require("conform").setup({
      format_on_save = {
        timeout_ms = is_termux and 3000 or 500,
        lsp_fallback = true,
        async = false,
      },
      formatters_by_ft = formatters_by_ft,
      -- Custom formatter options
      formatters = {
        shfmt = {
          prepend_args = { "-i", "2", "-ci" },
        },
        prettier = {
          prepend_args = { "--tab-width", "2" },
        },
        stylua = {
          prepend_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    })
  end,
}
