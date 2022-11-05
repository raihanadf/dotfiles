local M = {}

M.setup = function(on_attach, capabilities)
  -- for full configuration check disini:
  -- https://github.com/akinsho/flutter-tools.nvim
  require("flutter-tools").setup({
    ui = {
      border = "rounded",
      notification_style = "native",
    },
    closing_tags = {
      -- highlight = "ErrorMsg", -- highlight for the closing tag
      prefix = "> ", -- character to use for close tag e.g. > Widget
      enabled = true, -- set to false to disable
    },
    debugger = {
      enabled = true,
      run_via_dap = true,
    },
    widget_guides = {
      enabled = true,
    },
    lsp = {
      on_attach = on_attach,
      capabilities = capabilities,
      color = { -- show the derived colours for dart variables
        enabled = false, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
        background = false, -- highlight the background
        foreground = false, -- highlight the foreground
        virtual_text = true, -- show the highlight using virtual text
        virtual_text_str = "■", -- the virtual text character to highlight
      },
    },
  })
end
return M
