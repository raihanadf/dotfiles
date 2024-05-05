return {
  -- delete neovim buffers without losing window layout
  { 'famiu/bufdelete.nvim',          event = "VeryLazy" },
  -- smart, seamless, directional navigation and resizing of neovim + terminal multiplexer splits.
  { 'mrjones2014/smart-splits.nvim', event = "VeryLazy", },
  -- session
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      })
    end,
  },
  -- Dress ur pop up menu
  { 'stevearc/dressing.nvim', event = "VeryLazy", },


  -- Git related plugins
  { 'tpope/vim-fugitive',     event = "VeryLazy" },
  { 'tpope/vim-rhubarb',      event = "VeryLazy" },

  -- Detect tabstop and shiftwidth automatically
  { 'tpope/vim-sleuth',       event = "VeryLazy" },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim',  event = "VeryLazy", opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    event = "VeryLazy",
    opts = {},
  },

  -- used for autopairs of course
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
  },

  -- markdown preview
  -- install with yarn or npm
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },

  -- trouble is a friend
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
}
