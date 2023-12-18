local ok, bufferline = pcall(require, "bufferline")
if not ok then
	vim.notify("bufferline blom keinstall")
	return
end

bufferline.setup({
	options = {
		buffer_close_icon = "",
		themable = true,
		indicator = {
				style = 'icon',
		},
		modified_icon = "",
		show_close_icon = false,
		left_trunc_marker = "",
		right_trunc_marker = "",
		color_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "Explorer",
				text_align = "center",
				separator = false,
			},
		},
	},
	highlights = {
        fill = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        background = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        buffer_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        buffer_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator = {
            fg = { attribute = "bg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        separator_selected = {
            fg = { attribute = "fg", highlight = "Special" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        separator_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLineNC" },
        },
        close_button = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "StatusLine" },
        },
        close_button_selected = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
        close_button_visible = {
            fg = { attribute = "fg", highlight = "Normal" },
            bg = { attribute = "bg", highlight = "Normal" },
        },
    },
})
