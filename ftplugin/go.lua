vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = '*.go',
    callback = function()
        vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
        vim.wait(50)
    end
})
vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("/** ", " */")<cr>', { noremap = true, silent = true, buffer = true })
