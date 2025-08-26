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
			model = 'gpt-4.1',                           -- AI model to use
			temperature = 0.1,                           -- Lower = focused, higher = creative
			window = {
				layout = 'float',
				width = 80,     -- Fixed width in columns
				height = 20,    -- Fixed height in rows
				border = 'rounded', -- 'single', 'double', 'rounded', 'solid'
				title = '👁️ Truthseeking Oracle',
				zindex = 100,   -- Ensure window stays on top
			},

			headers = {
				user = 'You: ',
				assistant = '👁️ The Oracle: ',
				tool = '🔧 Tool: ',
			},
			separator = '━━',
			show_folds = false, -- Disable folding for cleaner look
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
