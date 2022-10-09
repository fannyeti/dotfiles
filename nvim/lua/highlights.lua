vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 0
vim.opt.background = "dark"

-- float window
vim.cmd([[
	highlight FloatBorder guibg=NONE ctermbg=NONE
	highlight link NormalFloat Normal
	highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	highlight Pmenu ctermbg=NONE guibg=NONE
	]])
