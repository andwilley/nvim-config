-- runtime path for parser directory
vim.opt.runtimepath:prepend("$HOME/.local/lib/nvim/parsers")

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- basic options
vim.opt.swapfile = false
vim.opt.fileencoding = 'utf-8'
vim.opt.history = 1000
vim.opt.gdefault = true
vim.g.mapleader = ","
vim.g.japlocalleader = ','
vim.opt.hidden = true
-- set ttyfast lazyredraw
vim.opt.laststatus = 2
vim.opt.modelines = 0
vim.opt.showmode = false
vim.opt.showcmd = true
-- vim.opt.backspace = [indent,eol,start]
vim.opt.visualbell = true
vim.opt.scrolloff = 3
vim.opt.autoread = true
vim.opt.ignorecase = true
-- line numbers and highlights
vim.opt.cursorline = true
vim.opt.ruler = true
vim.opt.number = true
vim.opt.clipboard = "unnamed"

-- whitespace
vim.opt.listchars:append {
  tab = "▷ ",
  extends = "»",
  precedes = "«",
  trail = "•",
}
vim.opt.list = true

-- list of files with 100 max cols (filetype must be detected, duh)
local long_files = {'soy', 'css', 'gss', 'scss', 'sql', 'java', 'kotlin', 'spansdl', 'bzl'}

-- splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.cmd("autocmd Filetype python setlocal tabstop=4")
vim.cmd("autocmd Filetype python setlocal shiftwidth=4")
vim.cmd("autocmd Filetype java setlocal tabstop=4")
vim.cmd("autocmd Filetype java setlocal shiftwidth=4")

-- special syntax cases
vim.cmd("autocmd BufNewFile,BufRead *.bash* set syntax=bash")
vim.cmd("autocmd BufNewFile,BufRead *.soy set syntax=soy")
vim.cmd("autocmd BufNewFile,BufRead *.proto set syntax=proto")
vim.cmd("autocmd BufNewFile,BufRead *.textproto set syntax=textproto")

-- drew's plugins
-- plugin keymaps are in plugin files
require("config.lazy")

-- lsp
vim.omnifunc = "v:lua.vim.lsp.omnifunc"

-- Regular mappings
local opts = { noremap = true, silent = true }

vim.keymap.set('n', ';', ':', opts)
vim.keymap.set('n', '<Leader>|', ':vsp<CR>:e<Space>', opts)
vim.keymap.set('n', '<Leader>-', ':sp<CR>:e<Space>', opts)
vim.keymap.set('n', '<Leader><Space>', ':noh<CR>', opts)
vim.keymap.set('n', '<F1>', '<ESC>', opts)
vim.keymap.set('n', '<tab>', '%', opts)

vim.keymap.set('v', '<tab>', '%', opts)
vim.keymap.set('v', '/', '/\v', opts)
vim.keymap.set('v', '<F1>', '<ESC>', opts)
vim.keymap.set('v', '*', 'y/<c-R>"<CR>', opts)

vim.keymap.set('i', '<F1>', '<ESC>', opts)
vim.keymap.set('i', 'jj', '<ESC>', opts)
