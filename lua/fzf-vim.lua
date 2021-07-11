vim.g.fzf_preview_window = {'right:45%', 'ctrl-/'}
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
vim.g.fzf_layout = {
    window={
        width=0.9,
        height=0.6
    }
}
vim.api.nvim_command("com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right:45%', 'ctrl-/'), <bang>0)")

require'common'.set_maps({
    { 'n', '<c-a>', ':Ag<cr>', {silent = true, noremap = true}},
    { 'n', '<c-p>', ':Files<cr>', {silent = true, noremap = true}},
    { 'n', '<c-h>', ':History<cr>', {silent = true, noremap = true}},
    { 'n', '<c-l>', ':BLines<cr>', {silent = true, noremap = true}},
    { 'n', '<c-g>', ':GFiles?<cr>', {silent = true, noremap = true}}
})
