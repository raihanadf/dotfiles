-- set your colorscheme here boi
local colorscheme = "warm"

local highlights = require('colorschemes.highlights')
local core_ok, color = pcall(require, 'colorschemes.colors.' .. colorscheme) 
if not core_ok then
  vim.cmd "colorscheme slate"
  vim.notify("colorscheme: " .. colorscheme .. " gak ketemu!")
  return
end

local function setup(opts)
  if opts == nil then
    opts = {}
  end
  local colors = color.get_colors()
  highlights.highlight_all(colors, opts)
end

setup({
  transparent_background = false
})
