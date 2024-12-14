-- lazy.nvim
return {
    'ricardoramirezr/blade-nav.nvim',
    dependencies = { -- totally optional
        'hrsh7th/nvim-cmp', -- if using nvim-cmp
    },
    ft = {'blade', 'php'}, -- optional, improves startup time
    opts = {
        close_tag_on_complete = true, -- default: true
    },
}
