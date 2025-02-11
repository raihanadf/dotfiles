return {
	"sindrets/diffview.nvim",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	config = function()
		require("diffview").setup({
			-- Configuration here, or leave empty to use defaults
		})
	end
}
