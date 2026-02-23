-- 不同的lsp和ft直接的映射
local lsp_by_ft = {
    lua = { "lua_ls" },
    solidity = { "solidity_ls" },
    javascript = { "vtsls", "tailwindcss" },
    javascriptreact = { "vtsls", "tailwindcss" },
    typescript = { "vtsls", "tailwindcss" },
    typescriptreact = { "vtsls", "tailwindcss" },
    vue = { "vue_ls", "vtsls", "tailwindcss" },
    html = { "html", "tailwindcss" },
    css = { "cssls", "tailwindcss" },
    scss = { "cssls", "tailwindcss" },
    less = { "cssls", "tailwindcss" },
    json = { "jsonls" },
    jsonc = { "jsonls" },
    go = { "gopls" },
    gomod = { "gopls" },
    gowork = { "gopls" },
    gotmpl = { "gopls" },
    sh = { "bashls" },
    bash = { "bashls" },
    zsh = { "bashls" },
}

vim.diagnostic.config({ signs = { text = { [1] = '┃', [2] = '┃', [3] = '┃', [4] = '┃' } }, update_in_insert = false })
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            scope = "cursor",
            focusable = false,
            border = "rounded",
            header = "",
            prefix = "",
        })
    end
})

local function enable_servers(filetype)
    for _, server in ipairs(lsp_by_ft[filetype] or {}) do
        vim.lsp.enable(server)
    end
end

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "VimEnter" }, {
    group = vim.api.nvim_create_augroup("MYLSPINIT", { clear = true }),
    callback = function(event) enable_servers(vim.bo[event.buf].filetype) end,
})
