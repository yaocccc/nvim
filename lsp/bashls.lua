return {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash', 'zsh' },
    root_markers = { '.git' },
    settings = {
        bashIde = {
            globPattern = '*@(.sh|.inc|.bash|.command|.zsh|.zshrc|.zshenv|.zprofile)',
        },
    },
}
