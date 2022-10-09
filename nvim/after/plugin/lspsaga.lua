local status_lspsaga_ok, lspsaga = pcall(require, "lspsaga")
if not status_lspsaga_ok then
	return
end

local symbols = require("symbols")

lspsaga.init_lsp_saga({
	border_style = "rounded",
	saga_winblend = 0,
	server_filetype_map = {
		typescript = "typescript",
	},
	finder_action_keys = {
		open = "<cr>",
	},
	show_outline = {
		jump_key = "<cr>",
	},
	code_action_icon = symbols.signs.Hint .. " ",
	code_action_lightbulb = {
		enable = true,
		enable_in_insert = false,
	},
	symbol_in_winbar = {
		enable = true,
		in_custom = true,
		separator = "❯ ",
	},
})
