return {
    cmd = { 'biome', 'lsp-proxy' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'json', 'jsonc' },
    root_markers = { 'biome.json', 'biome.jsonc' },
    settings = {
        configurationPath = vim.fn.stdpath('config') .. '/biome.json',
    }
}
