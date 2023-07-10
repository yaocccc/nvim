local G = require('G')

-- 以下是全局的autocmd

G.api.nvim_create_autocmd({ "BufEnter" }, { command = [[if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]] })
G.api.nvim_create_autocmd({ "BufReadPost" }, { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] })
G.api.nvim_create_autocmd({ "FileType" }, { command = "try | silent! loadview | catch | endtry" })
G.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, { command = "silent! mkview" })
G.api.nvim_create_autocmd({ "InsertEnter" }, { command = "hi CursorLine ctermbg=235" })
G.api.nvim_create_autocmd({ "InsertLeave" }, { command = "hi CursorLine ctermbg=none" })

-- 以下是for不同文件类型的相关配置

local function _go()
    G.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.go" }, command = "silent! call CocAction('runCommand', 'editor.action.organizeImport')" })
    G.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.go" }, command = "call CocAction('format')" })
    G.map({ { "v", "D", ":<c-u>call SurroundVaddPairs(\"/** \", \" */\")<cr>", { noremap = true, silent = true, buffer = true } }, })
end

local function _javascript()
    G.map({
        { "v", "D", ":<c-u>call SurroundVaddPairs(\"/** \", \" */\")<cr>", { noremap = true, silent = true, buffer = true } },
        { "v", "T", ":<c-u>call SurroundVaddPairs(\"try {\", \"} catch (e) {}\")<cr>", { noremap = true, silent = true, buffer = true } },
    })
end

local function _typescript()
    G.map({
        { "v", "D", ":<c-u>call SurroundVaddPairs(\"/** \", \" */\")<cr>", { noremap = true, silent = true, buffer = true } },
        { "v", "T", ":<c-u>call SurroundVaddPairs(\"try {\", \"} catch (e: any) {}\")<cr>", { noremap = true, silent = true, buffer = true } },
    })
end

local function _python()
    G.map({ { "v", "D", ":<c-u>call SurroundVaddPairs(\"/** \", \" */\")<cr>", { noremap = true, silent = true, buffer = true } }, })
end

local function _vue()
    G.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.vue" }, command = "call CocAction('format')" })
    G.map({ { "v", "D", ":<c-u>call SurroundVaddPairs(\"<!--\", \"--> \")<cr>", { noremap = true, silent = true, buffer = true } }, })
end

local function _markdown()
    G.hi({
        ["MDTodoDate"] = { fg = 71, italic = false },
        ["MDDoneDate"] = { fg = 71, italic = true, strikethrough = true },
        ["MDTodoText"] = { italic = false },
        ["MDDoneText"] = { fg = 37, italic = true, strikethrough = true },
        ["MDDeadline"] = { fg = 162, bold = true, underline = true },
        ["MDNearline"] = { fg = 178, bold = true },
    })
    G.cmd([[
        call matchadd('MDDeadline', 'D:'.strftime("%Y-%m-%d"))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 24))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 48))
    ]])
    G.map({
        { "n", "<cr>", ":call v:lua.G_markdown_toggleCheck(0)<cr><cr>", { noremap = true, silent = true, buffer = true } },
        { "n", "<2-LeftMouse>", ":call v:lua.G_markdown_toggleCheck(1)<cr><2-LeftMouse>", { noremap = true, silent = true, buffer = true } },
        { "v", "B", ':<c-u>call SurroundVaddPairs("**", "**")<cr>', { noremap = true, silent = true, buffer = true } },
        { "v", "I", ':<c-u>call SurroundVaddPairs("*", "*")<cr>', { noremap = true, silent = true, buffer = true } },
        { "v", "T", ':<c-u>call SurroundVaddPairs("- [ ] ", "")<cr>', { noremap = true, silent = true, buffer = true } },
        { "v", "`", ':<c-u>call SurroundVaddPairs("`", "``")<cr>', { noremap = true, silent = true, buffer = true } },
        { "v", "C", ':<c-u>call SurroundVaddPairs("```plaintext", "```")<cr>', { noremap = true, silent = true, buffer = true } },
        { "n", "<F6>", ':call v:lua.G_markdown_toggleMPTheme()<cr>', { noremap = true, silent = true, buffer = true } },
        { "i", "<F6>", '<esc>:call v:lua.G_markdown_toggleMPTheme()<cr>', { noremap = true, silent = true, buffer = true } },
    })
    G.cmd("call timer_start(0, 'v:lua.G_markdown_loadafter')") -- 延迟加载
end

local map = {
    go = _go,
    typescript = _typescript,
    javascript = _javascript,
    vue = _vue,
    python = _python,
    markdown = _markdown,
}

for filetype, func in pairs(map) do
    G.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { filetype },
        callback = function ()
            if G.b.loaded == 1 then return end; G.b.loaded = 1
            func()
        end
    })
end

-- 部分需要暴露到全局的函数

function G_markdown_loadafter()
    G.cmd([[syn match markdownError "\w\@<=\w\@="]])
    G.cmd([[syn match MDDoneDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
    G.cmd([[syn match MDTodoDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
    G.cmd([[syn match MDDoneText /- \[x\] \zs.*/ contains=MDDoneDate contained]])
    G.cmd([[syn match MDTodoText /- \[ \] \zs.*/ contains=MDTodoDate contained]])
    G.cmd([[syn match MDTask /- \[\(x\| \)\] .*/ contains=MDDoneText,MDTodoText]])
    G.cmd([[
        let b:md_block = '```'
        setlocal shiftwidth=2
        setlocal softtabstop=2
        setlocal tabstop=2
    ]])
end

function G_markdown_toggleCheck(needsave)
    local line = G.fn.getline('.')
    if line:match('^- %[ %]') then line = line:gsub('%[ %]', '[x]')
    elseif line:match('^- %[x%]') then line = line:gsub('%[x%]', '[ ]')
    else return end
    G.fn.setline('.', line)
    if needsave then G.cmd('w') end
end

function G_markdown_toggleMPTheme()
    G.g.mkdp_theme = G.g.mkdp_theme == 'dark' and 'light' or 'dark'
    G.cmd('MarkdownPreviewStop')
    G.cmd('sleep 500m')
    G.cmd('MarkdownPreview')
end
