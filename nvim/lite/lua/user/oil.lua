require("oil").setup({
  columns = {}, -- no file icons
  lsp_file_methods = {
    enabled = false,
  },
  watch_for_changes = true,
  use_default_keymaps = false,
  keymaps = {
    ["<CR>"] = "actions.select",
    ["-"] = { "actions.parent", mode = "n" },
    ["_"] = { "actions.open_cwd", mode = "n" },
  },
  view_options = {
    show_hidden = true,
    is_always_hidden = function(name, _) return name:match("^%.%.$") ~= nil end, -- hide '..'
  },
  confirmation = {
    border = "single",
  },
  progress = {
    border = "single",
  },
})

vim.keymap.set("n", "<leader>e", function()
    local oil = require "oil"
    oil.open()
end, { noremap = true, silent = true })
