return {
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
}
