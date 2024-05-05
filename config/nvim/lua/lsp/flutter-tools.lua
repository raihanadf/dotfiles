return {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = function()
        require("flutter-tools").setup({
            widget_guides = {
                enabled = true,
            },
            closing_tags = {
                -- highlight = "Special",
                prefix = " -- /",
            },
            dev_log = {
                open_cmd = "tabnew",
            },
            -- dev_tools = {
            --     autostart = true,
            --     auto_open_browser = true,
            -- },
        })
    end,
}
