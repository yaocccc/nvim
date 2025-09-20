local G = require('G')
local M = {}

function M.config()
end

function M.setup()
    G.hi({
        IndentLine = { fg = '#3c3c3c' },
        IndentLineCurrent = { fg = '#3a4f6a' },
    })
    require("indentmini").setup({
        only_current = false
    })
end

return M
