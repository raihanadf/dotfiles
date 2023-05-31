-- set your colorscheme here boi
-- built in colorscheme -- DIY

-- pake salah satu aja
local local_colorscheme = ""
local default_colorscheme = "oxocarbon"

local highlights = require("colorschemes.highlights")
local core_ok, color = pcall(require, "colorschemes.colors." .. local_colorscheme)

if not core_ok then

  vim.cmd("colorscheme " .. default_colorscheme)
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
