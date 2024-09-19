return {
  'akinsho/bufferline.nvim',
  event = "VeryLazy",
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require("bufferline")

    bufferline.setup({
      options = {
        separator_style = "slant",
        diagnostics = "nvim_lsp",
        buffer_close_icon = "",
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
            text = "File Explorer",
            text_align = "center",
            separator = false,
          },
        },
      },
    })
  end
}
