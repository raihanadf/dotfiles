return {
	"goolord/alpha-nvim",
	dependencies = { "kyazdani42/nvim-web-devicons" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local logo = {
			"                     __",
			"          .,-;-;-,. /'_\\",
			"        _/_/_/_|_\\_\\) /",
			"      '-<_><_><_><_>=/\\",
			"huhu    `/_/====/_/-'\\_\\",
			"         \"\"     \"\"    \"\"",
		}

		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = "AlphaHeader"

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl = "AlphaButton"
			b.opts.hl_shortcut = "AlphaButton"
			return b
		end

		dashboard.section.buttons.val = {
			button("Leader + e", "󰱼  Open File Explorer", ":NvimTreeToggle<cr>"),
			button("Leader + tt", "  Open Terminal", ":ToggleTerm<cr>"),
			button("Ctrl + p", "  Find File", ":Telescope find_files <cr>"),
			button("q", "  Quit", ":qa<cr>"),
		}

		-- local heading = {
		--   type = "text",
		--   val = "~ brain.exists() == null; ~",
		--   opts = {
		--     position = "center",
		--     hl = "AlphaComment",
		--   },
		-- }

		local function footer()
			local stats = require("lazy").stats()

			return "󱐌 Lazy-loaded " .. stats.loaded .. "/" .. stats.count .. " plugins"
		end

		dashboard.section.footer.val = footer()
		dashboard.section.footer.opts.hl = "AlphaFooter"
		local opts = {
			layout = {
				{ type = "padding", val = 2 },
				dashboard.section.header,
				{ type = "padding", val = 2 },
				-- heading,
				dashboard.section.buttons,
				dashboard.section.footer,
			},
			opts = {
				margin = 5,
			},
		}

		alpha.setup(opts)

		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable]])
		vim.api.nvim_create_augroup("alpha_tabline", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = "alpha_tabline",
			pattern = "alpha",
			command = "set showtabline=0 laststatus=0 noruler",
		})

		vim.api.nvim_create_autocmd("FileType", {
			group = "alpha_tabline",
			pattern = "alpha",
			callback = function()
				vim.api.nvim_create_autocmd("BufUnload", {
					group = "alpha_tabline",
					buffer = 0,
					command = "set showtabline=2 ruler laststatus=3",
				})
			end,
		})
	end
}
