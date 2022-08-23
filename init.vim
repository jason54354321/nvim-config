:set guicursor=
:set number
:set relativenumber
:set nohlsearch
:set noerrorbells
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set mouse=a
:set encoding=UTF-8
:set nowrap
:set ignorecase
:set smartcase
:set scrolloff=8
:set signcolumn=yes
:set cmdheight=2
:set updatetime=50

" Import
:source ~/.config/nvim/plug.vim

" Adding runtime path
set rtp+=~/.config/nvim/

lua require('jason')

" Syntax theme "{{{
" ---------------------------------------------------------------------

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

"}}}

" vim: set foldmethod=marker foldlevel=0:
