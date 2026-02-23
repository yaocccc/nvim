local vue_plugin_path = vim.fn.stdpath('data') .. '/mason/packages/vue-language-server/node_modules/@vue/language-server'

return {
    cmd = { 'vtsls', '--stdio' },
    filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
    settings = {
        vtsls = {
            tsserver = {
                globalPlugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vue_plugin_path,
                        languages = { 'vue' },
                        configNamespace = 'typescript',
                        enableForWorkspaceTypeScriptVersions = true,
                    },
                },
            },
        },
    },
}
