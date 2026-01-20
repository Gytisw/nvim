vim.loader.enable()

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

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
vim.opt.updatetime = 200
vim.opt.redrawtime = 10000
vim.opt.timeoutlen = 500
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

vim.opt.fillchars = {
  eob = " ",
  fold = " ",
  stl = " ",
  stlnc = " ",
  vert = "│",
  diff = "─",
  msgsep = "‾",
  foldopen = "",
  foldclose = "",
  foldsep = "│",
}
