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
require("config.lazy")

-- plugin keybindings and settings
local opts = { noremap = true, silent = true }

-- NERDtree
vim.keymap.set('n', '<leader>nt', ':NERDTreeToggle<CR>')
vim.keymap.set('n', '<leader>nf', ':NERDTreeFind<CR>')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, opts)
-- just open files (good for work where there are a lot)
vim.keymap.set('n', '<leader>fg', function () builtin.live_grep({grep_open_files=true}) end, opts)
-- get all files in the project root (don't use this at work)
vim.keymap.set('n', '<leader>fga', builtin.live_grep, opts)
vim.keymap.set('n', '<leader>fb', builtin.buffers, opts)
vim.keymap.set('n', '<leader>fh', builtin.help_tags, opts)

-- lsp
vim.omnifunc = "v:lua.vim.lsp.omnifunc"

vim.keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()", opts)
vim.keymap.set("n", "<leader>g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opts)
vim.keymap.set("n", "<leader>gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", opts)
vim.keymap.set("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.keymap.set("n", "<leader>gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.keymap.set("n", "<leader>gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.keymap.set("n", "<leader>gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.keymap.set("n", "<leader>gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Regular mappings
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

--[[
-- functions
fun! TrimWhitespace()
  let l:save=winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

-- get rid of the part of the path we don't want (this is pretty naive)
fun! TrimPath(path)
  let halves = split(a:path, 'google3/')
  return halves[-1]
endfun

-- replace the filename with BUILD
fun! ReplaceWithBuild(path)
  let bits = split(a:path, '/')
  let bits[-1] = 'BUILD'
  return join(bits, '/')
endfun
]]--

-- let the work config have the last word
local goog = io.open("$HOME/.goog/lua/goog.lua", r)
if goog ~= nil then
  package.path = "~/.goog/lua/goog.lua;" .. package.path
  require("goog")
  io.close(goog)
end
