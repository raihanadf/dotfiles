local M = {}

M.setup = function(on_attach, capabilities)
  -- for full configuration check disini:
  -- https://github.com/akinsho/flutter-tools.nvim
  require("flutter-tools").setup({
    experimental = {
      lsp_derive_paths = true,
    },
    flutter_lookup_cmd = nil,
    debugger = {
      enabled = true,
      -- run_via_dap = true,
    },
    widget_guides = {
      enabled = true,
    },
    closing_tags = {
      -- highlight = "Special",
      prefix = " -- ",
    },
    dev_log = {
      open_cmd = "tabnew",
    },
    -- dev_tools = {
    --   autostart = true,
    --   auto_open_browser = true,
    -- },
    outline = {
      open_cmd = "35vnew",
      auto_open = false,
    },p = {
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
