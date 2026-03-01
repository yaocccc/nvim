vim.keymap.set('v', 'D', ':<c-u>call SurroundVaddPairs("/** ", " */")<cr>', { noremap = true, silent = true, buffer = true })
vim.keymap.set('v', 'T', ':<c-u>call SurroundVaddPairs("try {", "} catch (e) {}")<cr>', { noremap = true, silent = true, buffer = true })
