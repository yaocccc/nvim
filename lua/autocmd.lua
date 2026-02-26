-- 以下是全局的autocmd
vim.api.nvim_create_autocmd({ "BufEnter" }, { command = [[if &buftype == '' && &readonly == 1 | set buftype=acwrite | set noreadonly | endif]] })
vim.api.nvim_create_autocmd({ "BufReadPost" }, { command = [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif]] })
vim.api.nvim_create_autocmd({ "FileType" }, { command = "try | silent! loadview | catch | endtry" })
vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, { command = "silent! mkview" })
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "hi CursorLine ctermbg=235 guibg=#262626" })
vim.api.nvim_create_autocmd({ "InsertLeave" }, { command = "hi CursorLine ctermbg=none guibg=none" })

-- 以下是for不同文件类型的相关配置
local function _go()
    vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.go" }, callback = function ()
        vim.lsp.buf.code_action({ context = { only = { "source.organizeImports" } }, apply = true })
        vim.wait(50)
        vim.lsp.buf.format({ async = false })
    end })
    vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("/** ", " */")<cr>', { noremap = true, silent = true, buffer = true })
end

local function _javascript()
    vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("/** ", " */")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'T', ':<c-u>call SurroundVaddPairs("try {", "} catch (e) {}")<cr>', { noremap = true, silent = true, buffer = true })
end

local function _typescript()
    vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("/** ", " */")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'T', ':<c-u>call SurroundVaddPairs("try {", "} catch (e) {}")<cr>', { noremap = true, silent = true, buffer = true })
end

local function _python()
    vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("\"\"\" ", " \"\"\"")<cr>', { noremap = true, silent = true, buffer = true })
end

local function _vue()
    vim.api.nvim_create_autocmd({ "BufWritePre" }, { pattern = { "*.vue" }, callback = function () vim.lsp.buf.format({ async = false }) end })
    vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("<!-- ", " -->")<cr>', { noremap = true, silent = true, buffer = true })
end

local function _markdown()
    vim.api.nvim_set_hl(0, "MDTodoDate", { fg = "#5faf5f", italic = false })
    vim.api.nvim_set_hl(0, "MDDoneDate", { fg = "#5faf5f", italic = true, strikethrough = true })
    vim.api.nvim_set_hl(0, "MDTodoText", { italic = false })
    vim.api.nvim_set_hl(0, "MDDoneText", { fg = "#00afaf", italic = true, strikethrough = true })
    vim.api.nvim_set_hl(0, "MDDeadline", { fg = "#d70087", bold = true, underline = true })
    vim.api.nvim_set_hl(0, "MDNearline", { fg = "#d7af00", bold = true })
    vim.cmd([[
        call matchadd('MDDeadline', 'D:'.strftime("%Y-%m-%d"))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 24))
        call matchadd('MDNearline', 'D:'.strftime("%Y-%m-%d", localtime() + 3600 * 48))
    ]])
    vim.keymap.set('n', '<cr>', ':call v:lua.G_markdown_toggleCheck(0)<cr><cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<2-LeftMouse>', ':call v:lua.G_markdown_toggleCheck(1)<cr><2-LeftMouse>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'B', ':<c-u>call SurroundVaddPairs("**", "**")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'I', ':<c-u>call SurroundVaddPairs("*", "*")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'T', ':<c-u>call SurroundVaddPairs("- [ ] ", "")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', '`', ':<c-u>call SurroundVaddPairs("`", "``")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('v', 'C', ':<c-u>call SurroundVaddPairs("```plaintext", "```")<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('n', '<F6>', ':call v:lua.G_markdown_toggleMPTheme()<cr>', { noremap = true, silent = true, buffer = true })
    vim.keymap.set('i', '<F6>', '<esc>:call v:lua.G_markdown_toggleMPTheme()<cr>', { noremap = true, silent = true, buffer = true })

    vim.cmd("call timer_start(0, 'v:lua.G_markdown_loadafter')") -- 延迟加载
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
    vim.api.nvim_create_autocmd({ "FileType" }, {
        pattern = { filetype },
        callback = function ()
            if vim.b.loaded == 1 then return end; vim.b.loaded = 1
            func()
        end
    })
end

-- 部分需要暴露到全局的函数
function G_markdown_loadafter()
    vim.cmd([[syn match markdownError "\w\@<=\w\@="]])
    vim.cmd([[syn match MDDoneDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
    vim.cmd([[syn match MDTodoDate /[SD]:\d\{4\}\([\/-]\d\d\)\{2\}/ contained]])
    vim.cmd([[syn match MDDoneText /\zs.*- \[x\] \zs.*/ contains=MDDoneDate contained]])
    vim.cmd([[syn match MDTodoText /- \[ \] \zs.*/ contains=MDTodoDate contained]])
    vim.cmd([[syn match MDTask /\zs.*- \[\(x\| \)\] .*/ contains=MDDoneText,MDTodoText]])
    vim.cmd([[
        let b:md_block = '```'
        setlocal shiftwidth=2
        setlocal softtabstop=2
        setlocal tabstop=2
    ]])
end

function G_markdown_toggleCheck(needsave)
    local line = vim.fn.getline('.')
    if line:match('^%s*- %[ %]') then line = line:gsub('%[ %]', '[x]')
    elseif line:match('^%s*- %[x%]') then line = line:gsub('%[x%]', '[ ]')
    else return end
    vim.fn.setline('.', line)
    if needsave then vim.cmd('w') end
end

function G_markdown_toggleMPTheme()
    vim.g.mkdp_theme = vim.g.mkdp_theme == 'dark' and 'light' or 'dark'
    vim.cmd('MarkdownPreviewStop')
    vim.cmd('sleep 500m')
    vim.cmd('MarkdownPreview')
end

function G_toggleBar(status)
    vim.cmd('set laststatus=' .. status)
    vim.cmd('set showtabline=' .. status)
    if status == 0 then
        vim.o.winbar = ' '
    end
end
