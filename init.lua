require('toni')

local ok, catppucin = pcall(require, "catppuccin")
if not ok then return end
--vim.g.catppuccin_flavour = "frappe"
catppucin.setup()
vim.cmd [[colorscheme catppuccin]]

