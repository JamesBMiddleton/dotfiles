local nvim_tree = require "nvim-tree"

nvim_tree.setup {
    on_attach = function(bufnr)
        local api = require('nvim-tree.api')
        local function opts(desc)
            return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set('n', '}', api.tree.change_root_to_node, opts('CD'))
        vim.keymap.set('n', '{', api.tree.change_root_to_parent, opts('..'))
    end,
    update_focused_file = {
        enable = true,
        update_cwd = false
    },
    renderer = {
        root_folder_label = false,
        add_trailing = true,
        icons = {
            show = {
                file = false,
                folder = false,
                folder_arrow = false,
                git = false,
            },
        },
    },
    git = {
        ignore = false
    },
    actions = {
        open_file = {
            quit_on_open = true,
        }
    }
}

--- KEYMAPS ---

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- open nvim-tree
keymap("n", "<leader>e", function()
    local api = require "nvim-tree.api"
    api.tree.open({current_window = true})
end, opts)

-- close nvim-tree
keymap("n", "<leader>E", function()
    local api = require "nvim-tree.api"
    api.tree.close()
end, opts)
