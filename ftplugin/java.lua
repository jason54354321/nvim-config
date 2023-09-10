-- See `:help vim.lsp.start_client` for an overview of the supported `config` options.
local jdtls_dir = vim.fn.stdpath('data') .. '/mason/packages/jdtls'
local config_dir = jdtls_dir .. "/config_win"
local path_to_plugins = jdtls_dir .. "/plugins/"
local path_to_lombok = jdtls_dir .. "/lombok.jar"
local path_to_jar = path_to_plugins .. "org.eclipse.equinox.launcher_1.6.500.v20230622-2056.jar"
-- local java_home = "C:/Program Files/Java/jdk-17"
local java_home = os.getenv("JAVA_HOME")

local java_exe_or_bin
if vim.fn.has('win32') == 1 then
	java_exe_or_bin = java_home .. '/bin/java.exe' 
else
	java_exe_or_bin = java_home .. '/bin/java' 
end

local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	print("Manual return in ftplugin/java.lua")
	return
end

-- An example how you could accomplish that is to infer the workspace directory name from the current working directory
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('data') .. '/site/java/workspace-root/' .. project_name
print("workspace_dir:")
print(workspace_dir)
if vim.fn.has('win32') == 1 then
	os.execute("mkdir " .. workspace_dir)
else
	os.execute("mkdir -p " .. workspace_dir)
end

-- Main Config
local config = {
	-- The command that starts the language server
	-- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
	cmd = {
		java_exe_or_bin, -- or '/path/to/java17_or_newer/bin/java'
		-- depends on if `java` is in your $PATH env variable and if it points to the right version.

		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-javaagent:' .. path_to_lombok,
		'-Xmx1g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',

		'-jar', path_to_jar,
		'-configuration', config_dir,
		'-data', workspace_dir,
	},

	-- Here you can configure eclipse.jdt.ls specific settings
	-- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
	-- for a list of options
	settings = {
		java = {
			-- edit
			home = java_home,
			eclipse = {
				downloadSources = true,
			},
			configuration = {
				updateBuildConfiguration = "interactive",
			},
			maven = {
				downloadSources = true,
			},
			implementationsCodeLens = {
				enabled = true,
			},
			referencesCodeLens = {
				enabled = true,
			},
			references = {
				includeDecompiledSources = true,
			},
			format = {
				enabled = true,
				settings = {
					url = vim.fn.stdpath "config" .. "/lang-servers/intellij-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},

		},
		signatureHelp = { enabled = true },
		completion = {
			favoriteStaticMembers = {
				"org.hamcrest.MatcherAssert.assertThat",
				"org.hamcrest.Matchers.*",
				"org.hamcrest.CoreMatchers.*",
				"org.junit.jupiter.api.Assertions.*",
				"java.util.Objects.requireNonNull",
				"java.util.Objects.requireNonNullElse",
				"org.mockito.Mockito.*",
			},
			importOrder = {
				"java",
				"javax",
				"com",
				"org"
			},
		},
		sources = {
			organizeImports = {
				starThreshold = 9999,
				staticStarThreshold = 9999,
			},
		},
		codeGeneration = {
			toString = {
				template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
			},
			useBlocks = true,
		},
	},

	flags = {
		allow_incremental_sync = true,
	},
	init_options = {
		bundles = {},
	},
}

config['on_attach'] = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set('n', '<Bslash>f', vim.lsp.buf.format, bufopts)
	vim.keymap.set('n', 'm', [[<cmd>lua require('lsp-selection-range').trigger()<CR>]], bufopts)
	vim.keymap.set('v', 'm', [[<cmd>lua require('lsp-selection-range').expand()<CR>]], bufopts)

	-- formatting
	if client.server_capabilities.documentFormattingProvider then
		vim.api.nvim_command [[augroup Format]]
		vim.api.nvim_command [[autocmd! * <buffer>]]
		vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]]
		vim.api.nvim_command [[augroup END]]
	end

	-- disable shit-like lsp highlight
	for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
		vim.api.nvim_set_hl(0, group, {})
	end
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
capabilities = require('lsp-selection-range').update_capabilities(capabilities)

require('jdtls').start_or_attach(config)
