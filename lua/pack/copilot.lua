local G = require('G')
G.g.copilot_no_tab_map = true
G.map({ {'i', '<Right>', 'copilot#Accept("<Right>")', {script = true, silent = true, expr = true}} })
G.map({ {'i', '<c-up>', 'copilot#Accept("<M-[>")', {script = true, silent = true, expr = true}} })
G.map({ {'i', '<c-down>', 'copilot#Accept("<M-]>")', {script = true, silent = true, expr = true}} })
