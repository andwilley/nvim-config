-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
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

-- file search
-- set path+=**
-- set wildmenu

-- basic search
-- set smartcase
-- set incsearch
-- set showmatch
-- set hlsearch

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

--[[ possibly handle these via treesitter
-- special syntax cases
vim.cmd("autocmd BufNewFile,BufRead *.bash* set syntax=bash")
vim.cmd("autocmd BufNewFile,BufRead *.soy set syntax=soy")
vim.cmd("autocmd BufNewFile,BufRead *.proto set syntax=proto")
vim.cmd("autocmd BufNewFile,BufRead *.textproto set syntax=textproto")
--]]

-- drew's plugins
require("config.lazy")

-- plugin keybindings
-- Nvim-tree
vim.keymap.set('n', '<leader>nt', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>nf', ':NvimTreeFindFile<CR>')

--[[
- delimiter closer
- codesearch -- internal
- cider lsp -- internal
- hg.nvim -- internal
- ripgrep -- non-work
- 'tpope/vim-fugitive'
- 'tpope/vim-abolish'
- 'tpope/vim-unimpaired'
- 'tpope/vim-repeat'
- 'tpope/vim-surround'
- 'mhinz/vim-signify'
--]]

--[[
-- source control stuff

" add these if not in goog env
if !filereadable(expand("~/.goog/goog.vim"))
  Plugin 'ycm-core/YouCompleteMe'
endif
call vundle#end()

" import goog stuff
if filereadable(expand("~/.goog/goog.vim"))
  source ~/.goog/goog.vim
else
  " setup non-goog stuff
endif

" YCM
set completeopt-=preview
let g:ycm_max_diagnostics_to_display = 0
let g:ycm_key_invoke_completion = '<leader>.'

" Think [i]de [s]how ...
" ... [e]xpand(error)
let g:ycm_key_detailed_diagnostics = '<leader>ise'
" ... [t]ype
nnoremap <leader>ist :YcmCompleter GetType<CR>
" ... [d]oc
nnoremap <leader>isd :YcmCompleter GetDoc<CR>
" ... [a]ll [d]iagnostics
nnoremap <leader>isad :YcmDiags<CR>
" ... [r]eferences
nnoremap <leader>isr :YcmCompleter GoToReferences<CR>

" Think [i]de [g]oto ...
" ... [def]inition
nnoremap <leader>igdef :YcmCompleter GoToDefinition<CR>
" ... [dec]laration
nnoremap <leader>igdec :YcmCompleter GoToDeclaration<CR>

" Think [i]de [c]hange ...
" ... [f]ix
nnoremap <leader>icf :YcmCompleter FixIt<CR>
" ... [r]ename
nnoremap <leader>icr :YcmCompleter RefactorRename<space>
" ... [o]rganize [i]mports
nnoremap <leader>icoi :YcmCompleter OrganizeImports<CR>

" NERD commenter
" <leader>c<space> is comment toggle
" <leader>cA switches comment symbol
" <leader>c$ comment from cursor to end of line
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" signify
set updatetime=100
]]--

-- Regular Mappings
vim.keymap.set('n', ';', ':')
vim.keymap.set('n', '<Leader>|', ':vsp<CR>:e<Space>')
vim.keymap.set('n', '<Leader>-', ':sp<CR>:e<Space>')
vim.keymap.set('n', '<Leader><Space>', ':noh<CR>')
vim.keymap.set('n', '<F1>', '<ESC>')
vim.keymap.set('n', '<tab>', '%')

--[[
-- copy the current full file path to the clipboard
vim.keymap.set('nn', <leader>sc :let @+=TrimPath(expand('%:p'))<CR>:echom "file path copied to clipboard"<CR>
-- put the current full file path on an 'edit' line
nnoremap <leader>sp :let @+=TrimPath(expand('%:p'))<CR>:e <C-R>%
-- open the BUILD file in the same directory as this file
nnoremap <leader>sb :exec 'e ' . ReplaceWithBuild(TrimPath(expand('%:p')))<CR>
-- search in buffers, populate qf list
nnoremap <leader>/b :call setqflist([])<CR>:bufdo vimgrepadd  %<left><left>
]]--

vim.keymap.set('v', '<tab>', '%')
vim.keymap.set('v', '/', '/\v')
vim.keymap.set('v', '<F1>', '<ESC>')
vim.keymap.set('v', '*', 'y/<c-R>"<CR>')

vim.keymap.set('i', '<F1>', '<ESC>')
vim.keymap.set('i', 'jj', '<ESC>')

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
