local ok, bufferline = pcall(require, "bufferline")
if not ok then
	vim.notify("bufferline blom keinstall")
	return
end

bufferline.setup({
	options = {
		buffer_close_icon = "",
		modified_icon = "",
		show_close_icon = false,
		left_trunc_marker = "",
		right_trunc_marker = "",
		color_icons = true,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "center",
				separator = false,
			},
		},
	},
})
