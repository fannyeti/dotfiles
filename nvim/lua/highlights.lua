vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = "pum"
vim.opt.pumblend = 0
vim.opt.background = "dark"

vim.cmd([[
	highlight FloatBorder guibg=NONE ctermbg=NONE
	highlight link NormalFloat Normal
	highlight NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
	highlight Pmenu ctermbg=NONE guibg=NONE
	]])

local has = function(x)
	return vim.fn.has(x) == 1
end
local is_mac = has("macunix")
local is_win = has("win32")

if is_mac then
	require("macos")
end
if is_win then
	require("windows")
end
