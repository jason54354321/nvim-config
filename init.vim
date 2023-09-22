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
:set signcolumn=number
:set cmdheight=1
:set numberwidth=5
:set updatetime=50
:set termguicolors
:set splitright
:let mapleader=" "

" dynamic scrolloff
:autocmd VimEnter,VimResized * let &scrolloff = winheight(0) / 4

if has("win32")
	set shell=pwsh.exe
	set shellxquote=
	let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
	let &shellquote   = ''
	let &shellpipe    = '| Out-File -Encoding UTF8 %s'
	let &shellredir   = '| Out-File -Encoding UTF8 %s'
endif



" --------- Import plugins ----------------
set rtp+=~/.config/nvim/
source ~/.config/nvim/plug.vim
lua require('jason')
" -----------------------------------------

" CamelCaseMotion
:let g:camelcasemotion_key = ','

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


" --------- highlight --------
:set cursorline
hi LineNr guibg=none guifg=#959895
hi CursorLineNr guibg=none guifg=#959895
hi @Comment guibg=none guifg=#828f94
" ----------------------------------


" --------- Key mapping ------------------
nnoremap <leader>q :q<CR>
" start-of-line/end-of-line
nnoremap H 0
nnoremap L $
xnoremap H ^
xnoremap L $

" scroll
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz

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

" Paste without refresh yank buffer
xnoremap p P
" Delete without refresh yank buffer
xnoremap <leader>d "_d

 
" c++: trim a defined method to declare state
nnoremap <leader>h f{da{a;0
" copy to clipboard
xnoremap <C-c> "+y
" Quick indent
xnoremap > >gv
xnoremap < <gv
" Markdown preview
nnoremap <leader>md :MarkdownPreview<CR>
" Move line up & down in visual mode 
xnoremap  J :m '>+1<CR>gv=gv
xnoremap  K :m '<-2<CR>gv=gv

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
" go to last loc when opening a buffer

lua << EOF
vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})
EOF

" ------------------------------------------

