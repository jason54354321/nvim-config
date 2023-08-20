 " :set guicursor=
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
:set scrolloff=4
:set signcolumn=number
:set cmdheight=1
:set updatetime=50
:set termguicolors
:set splitright
:let mapleader=" "

" CamelCaseMotion
" :let g:camelcasemotion_key = '<leader>'
:let g:camelcasemotion_key = ','

if has('win32')
	:set shell=pwsh
endif

" --------- Import plugins ----------------
set rtp+=~/.config/nvim/
source ~/.config/nvim/plug.vim
lua require('jason')
" -----------------------------------------


" --------- Dart settings -----------------
let dart_html_in_string=v:true
" -----------------------------------------

" --------- Golang settings -----------------
let g:go_doc_keywordprg_enabled = 0
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
" hi BufferLineIndicatorSelected guifg=#999999

" cmp highlight group
source ~/.config/nvim/colors/cmp_hi.vim
" -----------------------------------------


" --------- Current line highlight --------
" :set cursorline
" hi cursorline guibg=#213c52
" hi cursorlineNr guibg=none guifg=#3F5F8F
" hi cursorlineNr guibg=none guifg=#888888
" hi cursorlineNr guibg=none guifg=#18466b
" hi LineNr guibg=none guifg=#215052
" hi LineNr guibg=none guifg=#0c5154
hi LineNr guibg=none guifg=#444d5e
" ----------------------------------


" --------- Key bindings ------------------
nnoremap <leader>vv :Vex!<CR>
nnoremap <C-a> <C-^>
nnoremap <C-w>s <C-w>v
nnoremap <C-w>v <C-w>s 

" nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>

" resize buffer
nnoremap <C-Left> <C-w><
nnoremap <C-Right> <C-w>>
autocmd VimEnter * nnoremap <C-Down> <C-w>+
autocmd VimEnter * nnoremap <C-Up> <C-w>-

nnoremap <esc> :noh<CR>

" It's for multiple yank and paste action, not affecting single ones.
xnoremap <leader>p "_dP
" c++: trim a defined method to declare state
nnoremap <leader>h f{da{a;0
" c++: Quickly switch between .h and .cpp files
nnoremap <leader>/ :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" copy to clipboard
xnoremap <C-c> "+y
" grunt-screeps
nnoremap gu :!grunt screeps
" Quick indent
xnoremap > >gv
xnoremap < <gv
" Markdown preview
nnoremap <leader>md :MarkdownPreview<CR>
" Move entire line up & down
nnoremap <M-p> :m -2<CR>
nnoremap <M-n> :m +1<CR>


" ------------------------------------------

" --------- UltiSnips ------------------
autocmd FileType dart UltiSnipsAddFiletypes dart-flutter
let g:UltiSnipsExpandTrigger="<Plug>(ultisnips_expand)"
let g:UltiSnipsJumpForwardTrigger="<Plug>(ultisnips_jump_forward)"
let g:UltiSnipsJumpBackwardTrigger="<Plug>(ultisnips_jump_backward)"
let g:UltiSnipsListSnippets='<c-x><c-s>'
let g:UltiSnipsRemoveSelectModeMappings=0


" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" ------------------------------------------

" --------- Others  ------------------
"
" ------------------------------------------
