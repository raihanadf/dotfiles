local M = {}

M.setup = function(on_attach, capabilities)
  require("lspconfig").sumneko_lua.setup({
    settings = {
      Lua = {
        completion = { callSnippet = "Disable" },
        diagnostics = {
          globals = {
            "vim",
            "describe",
            "pending",
            "it",
            "before_each",
            "after_each",
            "setup",
            "teardown",
          },
        },
        runtime = { version = "LuaJIT" },
        workspace = {
          checkThirdParty = false,
          library = vim.api.nvim_get_runtime_file("", true),
          maxPreload = 2000,
        },
      },
    },
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

return M
