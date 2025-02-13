return {
	{
		'lervag/vimtex',
		init = function()
			vim.g.vimtex_view_method = 'sioyek'
			vim.g.vimtex_view_sioyek_exe = 'sioyek.exe'
			vim.g.vimtex_callback_progpath = 'wsl_nvim'
		end
	},
	{
		'jakewvincent/texmagic.nvim',
		opts = {}
	}
}
