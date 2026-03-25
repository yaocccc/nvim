local history = {}

function history.new()
    return setmetatable({}, { __index = history })
end

function history:get_completions(context, resolve)
    local items = {}
    local seen = {}
    local num = vim.fn.histnr('/')
    -- Newer items first
    for i = num, 1, -1 do
        local text = vim.fn.histget('/', i)
        if text ~= "" and not seen[text] then
            seen[text] = true
            table.insert(items, {
                label = text,
                kind = 1, -- Text
                insertText = text,
                score_offset = i, -- Newer items higher score
            })
        end
    end
    
    resolve({ items = items })
end

return history
