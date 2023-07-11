local M = {}

local _, lspconfig = pcall(require, "lspconfig")
if not _ then
  return
end

M.on_attach = function(client, _)
  client.server_capabilities.documentFormattingProvider = true
  client.server_capabilities.documentRangeFormattingProvider = true

  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local signs = {

  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
  virtual_text = true, -- disable virtual text
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
  border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  border = "rounded",
})

---------------------------- custom server setting -----------------------------

local server_setting = {

  -- specific
  "lua_ls", -- lua
  "flutter", -- flutter // uses flutter-tools

  -- web
  "html",
  -- "tailwindcss",
  "tsserver",
  "rome",

  -- php
  "intelephense",

  -- markdown
  "texlab",

  -- python
  "pyright"

}

for _, server in ipairs(server_setting) do
  local okay, _ = pcall(require, "core.lsp.settings." .. server)
  if not okay then
    lspconfig[server].setup({
      on_attach = M.on_attach,
      capabilities = M.capabilities,
    })
  else
    require("core.lsp.settings." .. server).setup(M.on_attach, M.capabilities)
    vim.notify(server)
  end
end

--------------------------------------------------------------------------------
