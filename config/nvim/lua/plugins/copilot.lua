return {
	{
		'github/copilot.vim',
		event = 'BufEnter',
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
			-- add any opts here
			provider = "copilot",
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
			"zbirenbaum/copilot.lua",      -- for providers='copilot'
		},
	}
}
