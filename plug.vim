call plug#begin('~/.config/nvim/plugged')

	Plug 'cohama/lexima.vim'
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'onsails/lspkind.nvim'
	Plug 'navarasu/onedark.nvim'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi'

	" Flutter
	Plug 'nvim-lua/plenary.nvim'
	Plug 'akinsho/flutter-tools.nvim'
	Plug 'dart-lang/dart-vim-plugin'
	
	" Sniipit
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

call plug#end()
