return {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.mjs', 'tailwind.config.ts' },
    settings = {
        tailwindCSS = {
            classAttributes = { 'class', 'className', 'class:list', 'classList', 'ngClass' },
            validate = true,
        },
    },
}
