local G = require('G')
local M = {}

function M.accept()
    if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
    else
        G.api.nvim_feedkeys(G.keycode("<Right>"), "n", true)
    end
end

function M.config()
    require("copilot").setup({
        suggestion = {
            enabled = true,
            auto_trigger = true,
            hide_during_completion = true,
            debounce = 15,
            trigger_on_accept = true,
            keymap = {
                accept = false,
                next = "<C-down>",
                prev = "<c-up>",
                accept_word = false,
                accept_line = false,
                dismiss = false,
                toggle_auto_trigger = false,
            },
        },
    })

    G.hi({ ["CopilotSuggestion"] = { fg = "#6e6e6e", italic = false } })
    G.keymap.set('i', '<right>', M.accept, { silent = true, expr = true })
end

return { "zbirenbaum/copilot.lua", event = "InsertEnter", config = M.config }
