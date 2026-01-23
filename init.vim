syntax on "syntax highlighting
filetype plugin indent on "allows filetype specific plugins to detect filetypes

set number "line numbers
set termguicolors "enable full terminal color range
set signcolumn=yes 

set tabstop=4
set shiftwidth=4
set expandtab

set scrolloff=4 "lines before a vert scroll is prompt
set nowrap "line wrapping off

set smartindent
set breakindent
set breakindentopt=shift:4

set linebreak

set ignorecase
set smartcase

set hlsearch "highlight search
set incsearch

set hidden

set updatetime=300
set shortmess+=c

set undofile
set undodir=~/.local/share/nvim/undo
set completeopt=menuone,noselect

" Set leader key
let mapleader=" "
let maplocalleader=" "

" Install vim-plug if not found
let s:plug = stdpath('data') . '/site/autoload/plug.vim'
if empty(glob(s:plug))
  echo "Installing vim-plug..."
  if executable('curl')
    silent execute '!curl -fLo ' . shellescape(s:plug) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  elseif executable('powershell')
    silent execute '!powershell -Command "iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | out-file -encoding ascii ' . shellescape(s:plug) . '"'
  endif
  echo "Done. Restart nvim and run :PlugInstall"
endif

call plug#begin('~/.local/share/nvim/plugged')

" Appearance
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'nvimdev/dashboard-nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-treesitter/nvim-treesitter'

" Movement (fzf)
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'nvim-tree/nvim-tree.lua'

" LSP installer & manager
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'

" Formatter
Plug 'mhartington/formatter.nvim'

" Auto-completion (no snippets)
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

"Dependancy
Plug 'nvim-tree/nvim-web-devicons'

call plug#end()

execute 'luafile ' . stdpath('config') . '/plug_opts.lua'
