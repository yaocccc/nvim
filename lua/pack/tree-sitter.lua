local G = require('G')
local M = {}

function M.intall(lang)
    local treesitter = require('nvim-treesitter')
    if G.list_contains(treesitter.get_available(), lang) then
        if not G.list_contains(treesitter.get_installed(), lang) then
            treesitter.install { lang }
            G.ts.start()
        end
    end
end

function M.parser_bootstrap()
    local filetype = G.api.nvim_eval('&ft')
    local lang = G.ts.language.get_lang(filetype)
    M.intall(lang)
end

function M.config()
    G.hi({
        ["@identifier"] = { fg = "NONE" }, -- 32
        ["@variable"] = { fg = "NONE" }, -- 32
        ["@function"] = { fg = "#0087ff" }, -- 32
        ["@function.call"] = { fg = "#0087ff" }, -- 32
        ["@operator"] = { fg = "#d75f00" }, -- 32
        ["@keyword.operator"] = { fg = "#d75f00" }, -- 32

        ["@property"] = { fg = "#d78700" }, -- 32
        ["@field"] = { fg = "#afd7af" }, -- 32
        ["@method"] = { fg = "#d75f00" }, -- 32
        ["@method.call"] = { fg = "#ff0000" }, -- 32
        ["@parameter"] = { fg = "#ff0000" }, -- 32

        ["@keyword"] = { fg = "#ff6666" }, -- 32
        ["@keyword.function"] = { fg = "#0087ff" }, -- 32
        ["@exception"] = { fg = "#0087ff" }, -- 32

        ["@statement"] = { fg = "#d75f00" }, -- 32
        ["@special"] = { fg = "#d78700" }, -- 32
        ["@comment"] = { fg = "#5faf5f", italic = true }, -- 32
        ["@include"] = { fg = "#800000" }, -- 32
        ["@type"] = { fg = "#d7af5f" }, -- 32
        ["@type.builtin"] = { fg = "#afd7af" }, -- 32
        ["@punctuation.bracket"] = { fg = "#afd7d7" }, -- 32

        ["@constructor"] = { fg = "#d78700" }, -- 32
        ["@namespace"] = { fg = "#d78700" }, -- 32

        ["@string"] = { fg = "#00afaf" }, -- 32
        ["@number"] = { fg = "#00afaf" }, -- 32
        ["@boolean"] = { fg = "#00afaf" }, -- 32

        ["@tag"] = { fg = "#d78700" }, -- 32
        ["@tag.attribute"] = { fg = "#d75f00" }, -- 32
        ["@tag.delimiter"] = { fg = "#afd7af" }, -- 32
        ["@conditional.ternary"] = { fg = "#800000" }, -- 32
        ["@punctuation.special"] = { fg = "#d78700" }, -- 32

        ["@text.literal"] = { fg = "#c0c0c0" }, -- 32

        ["@text.todo.unchecked"] = { fg = "#d78700" }, -- 32
        ["@text.todo.checked"] = { fg = "#00afaf" }, -- 32

        ["@markup.heading.1"] = { fg = "#87d7ff", bold = true }, -- 32
        ["@markup.heading.2"] = { fg = "#00afff", bold = true }, -- 32
        ["@markup.heading.3"] = { fg = "#afafff", bold = true }, -- 32
        ["@markup.heading.4"] = { fg = "#d78700", bold = true }, -- 32
        ["@markup.heading.5"] = { fg = "#d7af5f", bold = true }, -- 32
        ["@markup.heading.6"] = { fg = "#ff0000", bold = true }, -- 32

        ["@markup.raw.block@label"] = { fg = "#008000" }, -- 32

        ["@markup.raw.block"] = { fg = "#c0c0c0" }, -- 32
        ["@markup.quote"] = { fg = "#5faf5f", italic = true }, -- 32
        ["@markup.italic"] = { italic = true }, -- 32
        ["@markup.bold"] = { bold = true }, -- 32
        ["@markup.strikethrough"] = { strikethrough = true }, -- 32
        ["@markup.link"] = { fg = "#afafff", underline = true }, -- 32
        ["@markup.list"] = { fg = "#5fafd7" }, -- 32
    })

    -- some custom highlights
    G.hi({
        Todo = { fg = "#1c1c1c", bg = "#00afd7", bold = true }; -- 234/38
        TodoText = { fg = "#00afd7", bg = 'NONE', bold = true }; -- 38
        Note = { fg = "#1c1c1c", bg = "#5fd787", bold = true }; -- 234/78
        NoteText = { fg = "#5fd787", bg = 'NONE', bold = true }; -- 78
    })
    G.cmd([[call matchadd('Todo', 'TODO!*:\{0,1\}')]])
    G.cmd([[call matchadd('TodoText', 'TODO!*:\{0,1\}\zs.*')]])
    G.cmd([[call matchadd('Note', 'NOTE!*:\{0,1\}')]])
    G.cmd([[call matchadd('NoteText', 'NOTE!*:\{0,1\}\zs.*')]])
end

function M.setup()
    require('nvim-treesitter').setup()
    local langs = { 'typescript', 'javascript', 'vue', 'go', 'lua', 'markdown', 'markdown_inline' }
    for idx in pairs(langs) do M.intall(langs[idx]) end
    M.parser_bootstrap()
    G.cmd([[ au FileType * lua require('pack/tree-sitter').parser_bootstrap() ]])
    G.cmd([[ au BufRead * lua vim.treesitter.start() ]])
end

return M
