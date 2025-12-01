require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = {"clangd"},
}


-- Autocomplete config

local cmp = require("cmp")
cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping.confirm({ select = true})
    }),
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
    },
})

-- lsp config
vim.lsp.enable("clangd")
vim.lsp.enable('sqls')
vim.lsp.enable('ts_ls')
vim.lsp.enable('html')

-- autoformat
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.c",
    callback = function()
        vim.lsp.buf.format()
    end,
})


