local M = {}
M.setup = function(on_attach, capabilities)
-- for full configuration check disini:
-- https://github.com/akinsho/flutter-tools.nvim
  require("flutter-tools").setup{
    ui = {
      border = "rounded",
      notification_style = 'native'
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
    }
  }
end
return M
