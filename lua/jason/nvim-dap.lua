local dap = require('dap')
local dapui = require("dapui")

local data_path = vim.fn.stdpath('data')
local mason_bin_path = data_path .. '/mason/bin/';

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


-- TODO: needs to adapt to unix os(Unix dosen't have .cmd extension)
-- adapters
dap.adapters.codelldb = {
	type = 'server',
	port = "${port}",
	executable = {
		-- CHANGE THIS to your path!
		command = mason_bin_path .. 'codelldb.cmd',
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
