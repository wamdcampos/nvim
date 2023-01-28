
local options = { noremap = true, silent = true }
-- Move lines up/down with K and J
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")

-- Telescope
vim.keymap.set('n', '<leader>lg', '<cmd>Telescope live_grep<CR>', options)
vim.keymap.set('n', '<C-f>', '<cmd>Telescope current_buffer_fuzzy_find sorting_strategy=ascending prompt_position=top<CR>', options)
vim.keymap.set('n', '<leader>vd', '<cmd>Telescope diagnostics<CR>', options)
vim.keymap.set('n', '<leader>fe', '<cmd>Telescope file_browser<CR>', options)
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, options)
vim.keymap.set("x", "<leader>p", "\"_dP", options)

-- Disable arrows
vim.keymap.set('n', '<Left>', '<Nop>', options)
vim.keymap.set('n', '<Up>', '<Nop>', options)
vim.keymap.set('n', '<Down>', '<Nop>', options)
vim.keymap.set('n', '<Right>', '<Nop>', options)

vim.keymap.set('i', '<Left>', '<Nop>', options)
vim.keymap.set('i', '<Up>', '<Nop>', options)
vim.keymap.set('i', '<Down>', '<Nop>', options)
vim.keymap.set('i', '<Right>', '<Nop>', options)
