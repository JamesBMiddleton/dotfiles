vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim", version = "b9fd5226c2f76c951fc8ed5923d85e4de065e509" }, -- lua functions required by some plugins
    { src = "https://github.com/lewis6991/gitsigns.nvim", version = "944ef13cc8d8fe8b846c91f36041c8dfb85ca000" }, -- git integration
    { src = "https://github.com/nvim-telescope/telescope.nvim", version = "cfb85dcf7f822b79224e9e6aef9e8c794211b20b" }, -- fuzzy buffer, file, text finder
    { src = "https://github.com/stevearc/oil.nvim", version = "0fcc83805ad11cf714a949c98c605ed717e0b83e"}, -- directory tree
    { src = "https://github.com/neovim/nvim-lspconfig", version = "9ccd58a7949091c0cc2777d4e92a45a209c808c1" }, -- easier lsp language server setup
})
