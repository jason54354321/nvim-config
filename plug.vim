call plug#begin('~/.config/nvim/plugged')

	" Stuff
	Plug 'cohama/lexima.vim'
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi'
	Plug 'matze/vim-move'
	Plug 'tpope/vim-commentary'

	" File manager
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

	" Lsp plugin
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	Plug 'onsails/lspkind.nvim'
	Plug 'camilledejoye/nvim-lsp-selection-range'

	" Theme & Apearance
	Plug 'navarasu/onedark.nvim'
	Plug 'Mofiqul/vscode.nvim'
	Plug 'Everblush/everblush.nvim', { 'as': 'everblush' }
	" Plug 'vim-airline/vim-airline'
	" Plug 'vim-airline/vim-airline-themes'
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
	Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }

	" Flutter
	Plug 'nvim-lua/plenary.nvim'
	Plug 'akinsho/flutter-tools.nvim'
	Plug 'dart-lang/dart-vim-plugin'
	
	" Sniipit
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

call plug#end()
