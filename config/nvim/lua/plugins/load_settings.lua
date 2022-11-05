-- list semua plugin file setting
-- !! setup here !!
-- each plugin have their own setting
-- on settings/ folder so yeah

local plugins = {

	---------- ui ----------
	"alpha",          -- returns error idk
	"nvim-tree",      -- returns error too, TODO: fix later
	"bufferline",
	"cinnamon",
	"devicons",
	"colorizer",
	"comment",
	"toggleterm",
	"telescope",
	------------------------

	------- core? ----------
	"treesitter",
	"autopairs",
	"gitsigns",
	------------------------

	--------- misc ---------
	"presence",
	------------------------
}

for _, plugin in ipairs(plugins) do
	local ok, plug = pcall(require, "plugins.settings." .. plugin)

	-- check ada yg gagal gak
	if not ok then
		vim.notify("Error: file setting " .. plugin .. " ga ada ")
		return
	end

	-- jalanin setup buat plugin
	plug.setup()
end
