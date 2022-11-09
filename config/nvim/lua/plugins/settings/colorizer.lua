local ok, colorizer = pcall(require, "colorizer")
if not ok then
	vim.notify("colorizer blom keinstall")
	return
end

colorizer.setup()
vim.defer_fn(function()
	colorizer.attach_to_buffer(0)
end, 0)
