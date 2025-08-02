return {
	{
		'github/copilot.vim',
		event = 'BufEnter',
		config = function()
			vim.keymap.set('i', '<C-j>', function()
				return vim.fn['codeium#Accept']()
			end, { expr = true, noremap = true })
			vim.keymap.set('i', '<C-k>', function()
				return vim.fn['codeium#Previous']()
			end, { expr = true, noremap = true })
			vim.keymap.set('i', '<C-l>', function()
				return vim.fn['codeium#Next']()
			end, { expr = true, noremap = true })
		end,
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		dependencies = {
			{ "github/copilot.vim" },
			{ "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
		},
		build = "make tiktoken",                       -- Only on MacOS or Linux
		opts = {
			-- See Configuration section for options
		},
		-- See Commands section for default commands if you want to lazy load on them
	},
}
