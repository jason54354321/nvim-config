local dap = require('dap')
local dapui = require("dapui")

local data_path = vim.fn.stdpath('data')
local mason_bin_path = data_path .. '/mason/bin/';

local keymap = vim.keymap.set
keymap("n", "<F1>", ":lua require('dap').continue()<CR>", { silent = true })
keymap("n", "<F2>", ":lua require('dap').toggle_breakpoint()<CR>", { silent = true })
keymap("n", "<F3>", ":lua require('dap').step_over()<CR>", { silent = true })
keymap("n", "<F4>", ":lua require('dap').step_into()<CR>", { silent = true })

-- TODO: UI needed to RICE
-- TODO: Keybinding?
-- dap-ui
dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

local adapter_path
if vim.fn.has('win32') == 1 then
	adapter_path = mason_bin_path .. 'codelldb.cmd'
else
	adapter_path = mason_bin_path .. 'codelldb'
end
print("Printing adapter_path:" .. adapter_path)

-- TODO: needs to adapt to unix os(Unix dosen't have .cmd extension)
-- adapters
dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = adapter_path,
		args = { "--port", "${port}" },

		-- On windows you may have to uncomment this:
		-- detached = false,
	}
}

-- configurations
dap.configurations.cpp = {
	{
		name = "Launch file",
		type = "codelldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
		end,
		cwd = '${workspaceFolder}',
		stopOnEntry = false,
	},
}
