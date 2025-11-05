return {
	{
		'zbirenbaum/copilot.lua',
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                       -- Only on MacOS or Linux
		opts = {
			model = 'gpt-4.1',
			temperature = 0.1,
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
	{
		"yetone/avante.nvim",
		build = "make",
		event = "VeryLazy",
		version = false, -- Never set this value to "*"! Never!
		---@module 'avante'
		---@type avante.Config
		opts = {
			provider = "copilot",
			windows = {
				position = "left",

				-- disable automatic Insert mode for all chat-related windows
				input = {
					prefix = "> ",
					height = 8,
					start_insert = false,
				},
				edit = {
					border = "rounded",
					start_insert = false,
				},
				ask = {
					floating = false,
					border = "rounded",
					start_insert = false,
					focus_on_apply = "ours",
				},
			},
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua", -- for providers='copilot'
		},
	}
}
