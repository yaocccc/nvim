local G = require('G')
G.g.fzf_preview_window = {'right:45%', 'ctrl-/'}
G.g.fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
G.g.fzf_layout = {
    window={
        width=0.9,
        height=0.6
    }
}
G.cmd("com! -bar -bang Ag call fzf#vim#ag(<q-args>, fzf#vim#with_preview({'options': '--delimiter=: --nth=4..'}, 'right:45%', 'ctrl-/'), <bang>0)")
G.cmd([[
func! CHistory()
  call filter(v:oldfiles, "v:val =~ '^' . $PWD . '.*$'")
  call fzf#vim#history(fzf#vim#with_preview(), 0)
endf
]])
G.map({
    { 'n', '<c-a>', ':Ag<cr>', {silent = true, noremap = true}},
    { 'n', '<c-p>', ':Files<cr>', {silent = true, noremap = true}},
    { 'n', '<c-l>', ':BLines<cr>', {silent = true, noremap = true}},
    { 'n', '<c-g>', ':GFiles?<cr>', {silent = true, noremap = true}},
    { 'n', '<c-h>', ':call CHistory()<cr>', {silent = true, noremap = true}},
})
