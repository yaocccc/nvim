local G = require('G')
local run_cmd = { javascript = 'node', typescript = 'ts-node', html = 'google-chrome-stable', python = 'python', go = 'go run', sh = 'bash', lua = 'lua' }
G.g.floaterm_title = ''
G.g.floaterm_width = 0.8
G.g.floaterm_height = 0.8
G.g.floaterm_autoclose = 1
G.g.floaterm_opener = 'edit'
G.cmd("au BufEnter * if &buftype == 'terminal' | :call timer_start(50, { -> execute('startinsert!') }, { 'repeat': 3 }) | endif")
G.cmd("hi FloatermBorder ctermfg=fg ctermbg=none")
function FTToggle(name, cmd, pre_cmd)
    if G.fn['floaterm#terminal#get_bufnr'](name) ~= -1 then
        G.cmd(string.format('exec "FloatermToggle %s"', name))
    else
        G.cmd(string.format('exec "%s"', pre_cmd))
        G.cmd(string.format('FloatermNew --autoclose=0 --name=%s %s', name, cmd))
    end
end
function SetFTToggleMap(key, name, cmd, pre_cmd)
    G.map({
        { 'n', key, string.format(":call v:lua.FTToggle('%s', '%s', '%s')<cr>", name, cmd, pre_cmd), {silent = true, noremap = true}},
        { 't', key, "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('" .. name .. "') == bufnr('%') ? '' : '" .. key.. "') : '" .. key.. "'", {silent = true, expr = true}},
    })
end
function RunFile()
    G.cmd('w')
    local ft = G.eval('&ft')
    if run_cmd[ft] then FTToggle('RUN', run_cmd[ft] .. ' %', '')
    elseif ft == 'markdown' then G.cmd('MarkdownPreview')
    elseif ft == 'java' then FTToggle('RUN', 'javac % && java %<', '')
    elseif ft == 'c' then FTToggle('RUN', 'gcc % -o %< && ./%< && rm %<', '')
    end
end

G.cmd([[
    func! SetVimDir()
        try
            call system('~/scripts/edit-profile.sh VIM_TEM_DIR ' . $PWD)
        endtry
    endf
]])

SetFTToggleMap('<c-b>', 'DBUI', 'nvim +CALLDB', '')
SetFTToggleMap('<c-t>', 'TERM', '', 'call SetVimDir()')
G.map({
    { 'n', '<F5>', ':call v:lua.RunFile()<cr>', {silent = true, noremap = true}},
    { 'i', '<F5>', '<esc>:call v:lua.RunFile()<cr>', {silent = true, noremap = true}},
    { 't', '<F5>', "&ft == \"floaterm\" ? printf('<c-\\><c-n>:FloatermHide<cr>%s', floaterm#terminal#get_bufnr('RUN') == bufnr('%') ? '' : '<F5>') : '<F5>'", {silent = true, expr = true}} 
})
