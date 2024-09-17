call plug#begin('~/.config/nvim/plugged')

	" Stuff
	Plug 'm4xshen/autoclose.nvim'
	Plug 'tpope/vim-surround'
	Plug 'mg979/vim-visual-multi'
	Plug 'matze/vim-move'
	Plug 'tpope/vim-commentary'
	Plug 'bkad/CamelCaseMotion'
	Plug 'dstein64/vim-startuptime'

	" Git
	Plug 'tpope/vim-fugitive'
	Plug 'lewis6991/gitsigns.nvim'
	
	" Markdown preview
	Plug 'davidgranstrom/nvim-markdown-preview'

	" TreeSitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'nvim-treesitter/playground'
	Plug 'windwp/nvim-ts-autotag'
	Plug 'nvim-treesitter/nvim-treesitter-textobjects'

	" To become BLAZING fast
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-telescope/telescope-file-browser.nvim'
	Plug 'barrett-ruth/telescope-http.nvim'
	Plug 'ThePrimeagen/harpoon'
	Plug 'ggandor/leap.nvim'

	" Lsp plugin
	Plug 'neovim/nvim-lspconfig'
	Plug 'glepnir/lspsaga.nvim', { 'branch': 'main' }
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
	Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	Plug 'onsails/lspkind.nvim'
	Plug 'camilledejoye/nvim-lsp-selection-range'
	Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
	Plug 'WhoIsSethDaniel/mason-tool-installer.nvim'
	" Plug 'udalov/kotlin-vim'

	" Debugger
	Plug 'mfussenegger/nvim-dap'
	Plug 'nvim-neotest/nvim-nio'
	Plug 'rcarriga/nvim-dap-ui'

	" Theme & Apearance
	Plug 'navarasu/onedark.nvim'
	Plug 'Mofiqul/vscode.nvim'
	Plug 'Everblush/everblush.nvim', { 'as': 'everblush' }
	Plug 'nvim-lualine/lualine.nvim'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
	Plug 'https://github.com/tzachar/local-highlight.nvim'

	" Flutter
	Plug 'nvim-lua/plenary.nvim'
	Plug 'akinsho/flutter-tools.nvim'
	Plug 'dart-lang/dart-vim-plugin'

	" Golang
	Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

	" Java
	Plug 'mfussenegger/nvim-jdtls'
	
	" Sniipit
	Plug 'SirVer/ultisnips'
	Plug 'honza/vim-snippets'

call plug#end()
