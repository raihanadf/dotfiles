local luasnip = require("luasnip")
local options = {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

luasnip.config.set_config(options)

vim.api.nvim_create_autocmd("InsertLeave", {
  callback = function()
    if
      require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
      and not require("luasnip").session.jump_active
    then
      require("luasnip").unlink_current()
    end
  end,
})
