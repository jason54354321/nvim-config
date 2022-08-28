:set guicursor=
:set number
:set relativenumber
:set noerrorbells
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set softtabstop=2
:set smarttab
:set mouse=a
:set encoding=UTF-8
:set splitbelow
:set nowrap
:set ignorecase
:set smartcase
:set scrolloff=8
:set signcolumn=number
:set cmdheight=2
:set updatetime=50
:set termguicolors
:let mapleader=" "

" --------- Import plugins ----------------
set rtp+=~/.config/nvim/
source ~/.config/nvim/plug.vim
lua require('jason')
" -----------------------------------------

" --------- Dart settings -----------------
let dart_html_in_string=v:true
" -----------------------------------------

" --------- Colors & Appearance -----------
hi clear SignColumn
let g:airline_powerline_fonts = 1
colorscheme everblush

" hexokinase
let g:Hexokinase_ftEnabled = [
			\'css', 'html', 'javascript',
			\'vim', 'lua',
			\]

" bufferline colors
hi BufferLineIndicatorSelected guifg=#999999

" cmp highlight group
source ~/.config/nvim/colors/cmp_hi.vim
" -----------------------------------------


" --------- Current line highlight --------
" :set cursorline
" hi cursorline guibg=none
" hi cursorlineNr guibg=none guifg=#f3d8f3
" hi cursorlineNr guibg=none guifg=#edc5ed
" hi cursorlineNr guibg=none guifg=#e7b1e7
" hi cursorlineNr guibg=none guifg=#e09ee0
" ----------------------------------


" --------- Key bindings ------------------
nnoremap <leader>vv :Vex!<CR>
nnoremap <C-a> <C-^>
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" resize buffer
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
autocmd VimEnter * nnoremap <C-Down> <C-w>+
autocmd VimEnter * nnoremap <C-Up> <C-w>-

nnoremap <esc> :noh<CR>
" ------------------------------------------

" --------- UltiSnips ------------------
autocmd FileType dart UltiSnipsAddFiletypes dart-flutter
let g:UltiSnipsExpandTrigger="<tab>"
map <C-j> <Nop>
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------------------------------------


" --------- Others  ------------------
"
" ------------------------------------------
