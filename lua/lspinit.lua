local M = {}

M.lsp_by_ft = {
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

M.pkg_by_lsp = {
    lua_ls = "lua-language-server",
    vue_ls = "vue-language-server",
    vtsls = "vtsls",
    jsonls = "json-lsp",
    html = "html-lsp",
    cssls = "css-lsp",
    gopls = "gopls",
    bashls = "bash-language-server",
    tailwindcss = "tailwindcss-language-server",
    solidity_ls = "nomicfoundation-solidity-language-server",
}

vim.diagnostic.config({ signs = { text = { [1] = '┃', [2] = '┃', [3] = '┃', [4] = '┃' } }, update_in_insert = false })
vim.api.nvim_create_autocmd("CursorHold", {
    callback = function()
        vim.diagnostic.open_float(nil, {
            scope = "cursor",
            focusable = false,
            border = require("ui/gradient_border").get(),
            header = "",
            prefix = "",
        })
    end
})

vim.api.nvim_create_autocmd({ "FileType", "BufEnter", "VimEnter" }, {
    group = vim.api.nvim_create_augroup("MYLSPINIT", { clear = true }),
    callback = function(event)
        local ft = vim.bo[event.buf].filetype
        local registry = require("mason-registry")
        for _, lsp in ipairs(M.lsp_by_ft[ft] or {}) do
            local pkg_name = M.pkg_by_lsp[lsp]
            local ok, pkg = pcall(registry.get_package, pkg_name)
            if ok and not pkg:is_installed() then
                print("Installing " .. pkg_name .. " for " .. lsp)
                pkg:install()
            end
            vim.lsp.enable(lsp)
        end

        local needbiome = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'jsonc' }
        if vim.tbl_contains(needbiome, ft) then
            local ok, pkg = pcall(registry.get_package, 'biome')
            if ok and not pkg:is_installed() then
                print('Installing biome for formatting ' .. ft)
                pkg:install()
            end
        end
    end,
})
