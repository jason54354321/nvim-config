:set number
:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set encoding=UTF-8

" Import
:source ~/.config/nvim/plug.vim
:source ~/.config/nvim/color.vim

" Adding runtime path
set rtp+=~/.config/nvim/

lua require('jason')
