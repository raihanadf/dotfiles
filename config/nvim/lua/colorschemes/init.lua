-- set your colorscheme here boi
-- built in colorscheme -- DIY

-- pake salah satu aja
local colorscheme = "kanagawa-dragon"

local highlights = require("colorschemes.highlights")
local core_ok, color = pcall(require, "colorschemes.colors." .. colorscheme)

if not core_ok then
  local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not ok then
    vim.cmd("colorscheme desert")
  end
  -- additional config
  -- vim.opt.background = "dark"
  return
else
  local function setup(opts)
    if opts == nil then
      opts = {}
    end
    local colors = color.get_colors()
    highlights.highlight_all(colors, opts)
  end

  setup({
    transparent_background = false,
  })
end
