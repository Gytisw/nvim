-- Leader keys
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

-- Editor options
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.redrawtime = 10000
vim.opt.clipboard = "unnamedplus"
vim.opt.mouse = "a"
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = true

-- Remove ~ characters from end of buffer
vim.opt.fillchars = {
  eob = " ",   -- Remove ~ from end of buffer
  fold = " ",  -- Empty fold marker
  stl = " ",   -- Status line
  stlnc = " ", -- Status line NC
  vert = "│",  -- Vertical split
  diff = "─",  -- Diff
  msgsep = "‾", -- Message separator
  foldopen = "",  -- Fold open
  foldclose = "", -- Fold closed
  foldsep = "│",   -- Fold separator
}
