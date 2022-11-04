local colorscheme = "slate"

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
  vim.cmd "colorscheme slate"
  vim.notify("colorscheme: " .. colorscheme .. " not found!")
  return
end
