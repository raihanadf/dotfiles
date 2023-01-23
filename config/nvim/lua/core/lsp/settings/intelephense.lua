local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").intelephense.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = {
      globalStoragePath = os.getenv("HOME") .. "/.local/share/intelephense",
    },
  })
end

return M
