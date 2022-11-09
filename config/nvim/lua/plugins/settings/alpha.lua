local ok, alpha = pcall(require, "alpha")
if not ok then
	vim.notify("alpha blom keinstall")
	return
end

local dash_ok, dashboard = pcall(require, "alpha.themes.dashboard")
if not dash_ok then
	vim.notify("error theme alpha")
	return
end
math.randomseed(os.time())

local logo = {
" __________________ ",
"< shut the fuck up >",
" ------------------ ",
"   \\",
"    \\",
"        .--.",
"       |o_o |",
"       |:_/ |",
"      //   \\ \\",
"     (|     | )",
"    /'\\_   _/`\\",
"    \\___)=(___/",
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
	button("Leader + e", "  Open File Explorer", ":NvimTreeToggle<cr>"),
	button("Leader + tt", "  Open Terminal", ":ToggleTerm<cr>"),
	button("Ctrl + p", "  Find File", ":Telescope find_files <cr>"),
	button("q", "  Quit", ":qa<cr>"),
}

local heading = {
	type = "text",
	val = "~ brain.exists() == null; ~",
	opts = {
		position = "center",
		hl = "AlphaComment",
	},
}

local function footer()
	return "You should try to hate yourself more ;) "
end

dashboard.section.footer.val = footer()
dashboard.section.footer.opts.hl = "AlphaFooter"
local opts = {
	layout = {
		{ type = "padding", val = 2 },
		dashboard.section.header,
		-- { type = "padding", val = 2 },
		-- heading,
		{ type = "padding", val = 4 },
		dashboard.section.buttons,
		{ type = "padding", val = 1 },
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
