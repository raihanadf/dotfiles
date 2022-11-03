local configs = require'nvim-treesitter.configs'

  configs.setup {

  ensure_installed = "all", -- Only use parsers that are maintained
  auto_install = true,
  sync_install = false,
  highlight = { -- enable highlighting
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = false, -- default is disabled anyways
    },
  disable = { "html" },
  }
-- folding
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
--
require'nvim-treesitter.configs'.setup {
  autotag = {
    enable = true,
  }
}

-- vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(
--     vim.lsp.diagnostic.on_publish_diagnostics,
--     {
--         underline = true,
--         virtual_text = {
--             spacing = 5,
--             severity_limit = 'Warning',
--         },
--         update_in_insert = true,
--     }
-- )
