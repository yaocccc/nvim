local G = require('G')
local M = {}

function M.config()
    G.g.interestingWordsRandomiseColors = 1
    G.map({
        { 'n', 'ff', ":call InterestingWords('n')<cr>", {silent = true, noremap = true}},
        { 'n', 'FF', ":call UncolorAllWords()<cr>", {silent = true, noremap = true}},
        { 'n', 'n', ":call WordNavigation('forward')<cr>", {silent = true, noremap = true}},
        { 'n', 'N', ":call WordNavigation('backward')<cr>", {silent = true, noremap = true}},
    })
end

function M.setup()
    -- do nothing
end

return M
