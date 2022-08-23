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
:set signcolumn=number
:set cmdheight=2
:set updatetime=50

" Import plugins
set rtp+=~/.config/nvim/
:source ~/.config/nvim/plug.vim
lua require('jason')

" colors
highlight clear SignColumn
colorscheme onedark
