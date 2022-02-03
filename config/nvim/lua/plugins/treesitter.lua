local configs = require'nvim-treesitter.configs'
configs.setup {
ensure_installed = "maintained", -- Only use parsers that are maintained
highlight = { -- enable highlighting
  enable = true,
},
indent = {
  enable = false, -- default is disabled anyways
  }
}
-- folding
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
