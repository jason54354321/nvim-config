require('jason.lspconfig')
require('flutter-tools').setup{ 
	ui = {
		-- the border type to use for all floating windows, the same options/formats
		-- used for ":h nvim_open_win" e.g. "single" | "shadow" | {<table-of-eight-chars>}
		border = "rounded",
		-- This determines whether notifications are show with `vim.notify` or with the plugin's custom UI
		-- please note that this option is eventually going to be deprecated and users will need to
		-- depend on plugins like `nvim-notify` instead.
		notification_style = 'native',
	},
	decorations = {
    statusline = {
      -- set to true to be able use the 'flutter_tools_decorations.app_version' in your statusline
      -- this will show the current version of the flutter app from the pubspec.yaml file
      app_version = true,
      -- set to true to be able use the 'flutter_tools_decorations.device' in your statusline
      -- this will show the currently running device if an application was started with a specific
      -- device
      device = true,
    },
  },
	widget_guides = {
		enabled = true,
	},
	dev_log = {
    enabled = true,
		open_cmd = string.format("bot %dnew", vim.o.lines/5)
  },
	lsp = {
    color = { -- show the derived colours for dart variables
      enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
      background = false, -- highlight the background
      foreground = false, -- highlight the foreground
      virtual_text = true, -- show the highlight using virtual text
      virtual_text_str = "■", -- the virtual text character to highlight
    },
    settings = {
      showTodos = true,
      completeFunctionCalls = true,
      --analysisExcludedFolders = {""},
      renameFilesWithClasses = "prompt", -- "always"
      enableSnippets = false,
			flutterGutterIcons = true,
    }
  },
}
