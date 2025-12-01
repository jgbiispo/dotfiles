require("nvim-treesitter.configs").setup({
    ensure_installed = { "c", "lua", "vim", "vimdoc" },
    highlight = {enable = true},
    indent = {enable = true},
})
