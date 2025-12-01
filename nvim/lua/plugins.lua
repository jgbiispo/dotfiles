local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- LSP
    { "neovim/nvim-lspconfig" },
    { "williamboman/mason.nvim", config=true },
    { "williamboman/mason-lspconfig.nvim" },

    -- Autocomplete
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-buffer" },
    { "L3MON4D3/LuaSnip" },

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- File explorer
    { "nvim-tree/nvim-tree.lua", config = true},

    -- Tema
    { "ellisonleao/gruvbox.nvim" },

    -- Autoindent
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts= {} },

    -- Copilot
    {"github/copilot.vim"}
})
