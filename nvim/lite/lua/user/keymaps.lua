vim.g.mapleader = " "      -- space as leader key
vim.g.maplocalleader = " " -- space as local leader key?

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- stop space moving cursor
keymap("", "<Space>", "<Nop>", opts)

-- remove search highlighting (<cr> = carriage return)
keymap("n", "<Space><Space>", ":set invhls<CR>", opts)

-- visual line navigation
keymap("n", "j", "gj", opts)
keymap("n", "k", "gk", opts)

-- lsp or ctags go-to-definition
keymap("n", "gd", "<C-]>zt", opts)

-- smart tab navigate down completion list
keymap("i", "<Tab>", "v:lua.smart_tab()", { expr = true, noremap = true })
function _G.smart_tab()
    if vim.fn.pumvisible() == 1 then return "<C-N>" else return "\t" end
end

-- smart tab navigate up completion list
keymap("i", "<S-Tab>", "v:lua.smart_shift_tab()", { expr = true, noremap = true })
function _G.smart_shift_tab()
    if vim.fn.pumvisible() == 1 then return "<C-P>" else return "\t" end
end

-- smart tab show completions if available
vim.api.nvim_create_autocmd("InsertCharPre", {
    pattern = "*.c, *.lua",
    callback = function()
        if vim.fn.pumvisible() == 0 and vim.fn.getline("."):sub(vim.fn.col(".") - 1):match("%w") then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-X><C-O>", true, false, true), "n")
        end
    end
})

-- better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- stay in visual mode when indenting
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- don't include newline when going to end of line in visual mode
keymap("v", "$", "$h", opts)

-- don't yank text over paste selection in visual mode
keymap("v", "p", "P", opts)

-- fast scroll, don't add to jumplist (Ctrl+I/O) in normal mode
vim.cmd([[nnoremap <silent> J :<C-u>execute "keepjumps normal! 10<C-v><C-e>M"<CR>]])
vim.cmd([[nnoremap <silent> K :<C-u>execute "keepjumps normal! 10<C-v><C-y>M"<CR>]])
keymap("v", "J", "10<C-e>M", opts)
keymap("v", "K", "10<C-y>M", opts)
keymap("n", "<C-e>", "J", opts)
keymap("v", "<C-e>", "J", opts)

-- unique note creation
keymap("n", "<C-n>", function()
    name = vim.fn.input("filename: ")
    if name == "" then
        name = "daily"
    end
    local date = vim.fn.system("date +'%Y%m%d%H%M'")
    filename = name .. " " .. date:sub(0,-2) .. ".md"
    filepath = "Notes/" .. filename
    vim.cmd("silent !touch " .. "'" .. filepath .. "'")
    template = '***\\ntags:\\nstatus: \\#atomic\\n***\\n'
    vim.cmd("silent !printf " .. "'" .. template .. "' >> " .. "'" .. filepath .. "'") 
    vim.cmd("e " .. filepath)
end, opts)
