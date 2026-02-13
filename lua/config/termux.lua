-- Termux LSP Auto-Installer
-- Automatically detects and installs missing LSP servers on Termux

local M = {}

-- Detect if running on Android (includes Termux and proot-distro like Kali Nethunter)
-- Uses kernel detection which is more reliable than PREFIX check
local function is_android()
  -- Check kernel name for "Android" which works in both Termux and proot-distro
  local kernel = vim.fn.system({ "uname", "-s" }):gsub("%s+", "")
  if kernel:match("Linux") then
    -- On Linux, check if we're running on Android kernel
    local release = vim.fn.system({ "uname", "-r" }):gsub("%s+", "")
    -- Android kernels often have specific patterns or we can check for Android properties
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

-- Only run on Android (Termux, proot-distro, Kali Nethunter, etc.)
M.is_termux = is_android()

if not M.is_termux then
  M.setup = function() end
  return M
end

-- LSP installation definitions
-- Format: { name, check_cmd, install_cmd, description }
M.lsp_packages = {
  -- Node.js based LSPs (installed via npm)
  {
    name = "bash-language-server",
    check = "bash-language-server",
    install = "npm install -g bash-language-server",
    desc = "Bash LSP",
  },
  {
    name = "typescript-language-server",
    check = "typescript-language-server",
    install = "npm install -g typescript typescript-language-server",
    desc = "TypeScript/JavaScript LSP",
  },
  {
    name = "vscode-langservers",
    check = "vscode-json-language-server",
    install = "npm install -g vscode-langservers-extracted",
    desc = "JSON/HTML/CSS LSP (VSCode)",
  },
  {
    name = "yaml-language-server",
    check = "yaml-language-server",
    install = "npm install -g yaml-language-server",
    desc = "YAML LSP",
  },
  {
    name = "pyright",
    check = "pyright-langserver",
    install = "npm install -g pyright",
    desc = "Python LSP (Pyright)",
  },
  -- System packages (installed via pkg)
  {
    name = "clang",
    check = "clangd",
    install = "pkg install -y clang",
    desc = "C/C++ LSP (clangd)",
    pkg = true,
  },
  {
    name = "lua-language-server",
    check = "lua-language-server",
    install = "pkg install -y lua-language-server",
    desc = "Lua LSP",
    pkg = true,
  },
  {
    name = "gopls",
    check = "gopls",
    install = "pkg install -y gopls",
    desc = "Go LSP",
    pkg = true,
  },
  {
    name = "rust-analyzer",
    check = "rust-analyzer",
    install = "pkg install -y rust-analyzer",
    desc = "Rust LSP",
    pkg = true,
  },
}

-- Required base packages for LSP installation
M.base_packages = {
  { name = "nodejs", check = "node", install = "pkg install -y nodejs" },
  { name = "npm", check = "npm", install = "pkg install -y nodejs" },
  { name = "python", check = "python", install = "pkg install -y python" },
}

-- Check if a command exists
function M.executable_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Get list of missing LSPs
function M.get_missing_lsps()
  local missing = {}
  for _, lsp in ipairs(M.lsp_packages) do
    if not M.executable_exists(lsp.check) then
      table.insert(missing, lsp)
    end
  end
  return missing
end

-- Get list of missing base packages
function M.get_missing_base()
  local missing = {}
  for _, pkg in ipairs(M.base_packages) do
    if not M.executable_exists(pkg.check) then
      table.insert(missing, pkg)
    end
  end
  return missing
end

-- State tracking
M.state = {
  checking = false,
  installing = false,
  last_check = nil,
  install_log = {},
}

-- Notification helper with persistent display
local function notify(msg, level, opts)
  opts = opts or {}
  opts.title = opts.title or "Termux LSP Installer"
  vim.notify(msg, level or vim.log.levels.INFO, opts)
end

-- Run shell command asynchronously
function M.run_async(cmd, on_complete)
  local output = {}
  local job_id = vim.fn.jobstart(cmd, {
    on_stdout = function(_, data)
      for _, line in ipairs(data) do
        if line ~= "" then
          table.insert(output, line)
        end
      end
    end,
    on_stderr = function(_, data)
      for _, line in ipairs(data) do
        if line ~= "" then
          table.insert(output, line)
        end
      end
    end,
    on_exit = function(_, exit_code)
      if on_complete then
        on_complete(exit_code, output)
      end
    end,
  })
  return job_id
end

-- Install a single package
function M.install_package(pkg, callback)
  notify("Installing: " .. pkg.desc .. "...", vim.log.levels.INFO)
  
  M.run_async(pkg.install, function(exit_code, output)
    if exit_code == 0 then
      notify("✓ Installed: " .. pkg.desc, vim.log.levels.INFO)
      table.insert(M.state.install_log, { pkg = pkg.name, status = "success" })
    else
      notify("✗ Failed: " .. pkg.desc, vim.log.levels.ERROR)
      table.insert(M.state.install_log, { pkg = pkg.name, status = "failed", output = output })
    end
    if callback then
      callback(exit_code == 0)
    end
  end)
end

-- Install all missing packages sequentially
function M.install_missing(missing_lsps, callback)
  if #missing_lsps == 0 then
    if callback then callback() end
    return
  end

  local current_idx = 1
  local function install_next()
    if current_idx > #missing_lsps then
      if callback then callback() end
      return
    end

    local pkg = missing_lsps[current_idx]
    current_idx = current_idx + 1
    M.install_package(pkg, function(_)
      install_next()
    end)
  end

  install_next()
end

-- Show installation prompt
function M.prompt_install(missing)
  if #missing == 0 then
    return
  end

  local missing_names = {}
  for _, lsp in ipairs(missing) do
    table.insert(missing_names, "  • " .. lsp.desc)
  end

  local msg = "Missing LSP servers detected:\n" .. table.concat(missing_names, "\n") .. "\n\nInstall now?"
  
  vim.ui.select({ "Yes, install all", "No, remind me later", "Never ask again" }, {
    prompt = "Termux LSP Setup",
  }, function(choice)
    if choice == "Yes, install all" then
      M.state.installing = true
      notify("Starting LSP installation...", vim.log.levels.INFO)
      
      -- First install base packages if missing
      local missing_base = M.get_missing_base()
      M.install_missing(missing_base, function()
        -- Then install LSPs
        M.install_missing(missing, function()
          M.state.installing = false
          local success_count = 0
          for _, log in ipairs(M.state.install_log) do
            if log.status == "success" then
              success_count = success_count + 1
            end
          end
          notify(string.format("Installation complete! %d/%d packages installed.", success_count, #missing + #missing_base), vim.log.levels.INFO)
          notify("Please restart Neovim to activate LSP servers.", vim.log.levels.WARN)
        end)
      end)
    elseif choice == "Never ask again" then
      -- Save preference
      local data_path = vim.fn.stdpath("data") .. "/termux_lsp_skip"
      vim.fn.writefile({ "skip" }, data_path)
      notify("LSP installation disabled. Run :TermuxLspInstall to install manually.", vim.log.levels.INFO)
    end
  end)
end

-- Check and prompt on startup
function M.check_and_prompt()
  if M.state.checking or M.state.installing then
    return
  end

  -- Check if user opted out
  local skip_file = vim.fn.stdpath("data") .. "/termux_lsp_skip"
  if vim.fn.filereadable(skip_file) == 1 then
    return
  end

  M.state.checking = true
  M.state.last_check = os.time()

  -- Defer to not block startup
  vim.defer_fn(function()
    local missing = M.get_missing_lsps()
    M.state.checking = false

    if #missing > 0 then
      M.prompt_install(missing)
    end
  end, 1000) -- 1 second delay
end

-- Manual installation command
function M.install_all()
  local missing = M.get_missing_lsps()
  if #missing == 0 then
    notify("All LSP servers are already installed!", vim.log.levels.INFO)
    return
  end

  M.state.installing = true
  notify("Installing " .. #missing .. " LSP server(s)...", vim.log.levels.INFO)

  local missing_base = M.get_missing_base()
  M.install_missing(missing_base, function()
    M.install_missing(missing, function()
      M.state.installing = false
      notify("Installation complete! Please restart Neovim.", vim.log.levels.INFO)
    end)
  end)
end

-- Show status
function M.status()
  local lines = { "Termux LSP Status", string.rep("─", 40) }
  
  for _, lsp in ipairs(M.lsp_packages) do
    local installed = M.executable_exists(lsp.check)
    local status = installed and "✓" or "✗"
    local color = installed and "String" or "Error"
    table.insert(lines, string.format("%s %s (%s)", status, lsp.desc, lsp.check))
  end

  table.insert(lines, "")
  table.insert(lines, "Base packages:")
  for _, pkg in ipairs(M.base_packages) do
    local installed = M.executable_exists(pkg.check)
    local status = installed and "✓" or "✗"
    table.insert(lines, string.format("  %s %s", status, pkg.name))
  end

  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "Termux LSP Status" })
end

-- Reset "never ask" preference
function M.reset_prompt()
  local skip_file = vim.fn.stdpath("data") .. "/termux_lsp_skip"
  if vim.fn.filereadable(skip_file) == 1 then
    vim.fn.delete(skip_file)
    notify("LSP installation prompt re-enabled.", vim.log.levels.INFO)
  else
    notify("LSP installation prompt was already enabled.", vim.log.levels.INFO)
  end
end

-- Setup function called from init
function M.setup()
  if not M.is_termux then
    return
  end

  -- Create user commands
  vim.api.nvim_create_user_command("TermuxLspInstall", function()
    M.install_all()
  end, { desc = "Install missing LSP servers on Termux" })

  vim.api.nvim_create_user_command("TermuxLspStatus", function()
    M.status()
  end, { desc = "Show Termux LSP installation status" })

  vim.api.nvim_create_user_command("TermuxLspReset", function()
    M.reset_prompt()
  end, { desc = "Re-enable Termux LSP installation prompt" })

  -- Check on startup (deferred)
  vim.api.nvim_create_autocmd("VimEnter", {
    callback = function()
      M.check_and_prompt()
    end,
    once = true,
  })
end

return M
