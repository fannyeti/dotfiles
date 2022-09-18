local status_aerial_ok, aerial = pcall(require, "aerial")
if not status_aerial_ok then
	return
end

aerial.setup({
	backends = {
		["_"] = { "lsp", "treesitter" },
		javascript = { "lsp", "treesitter" },
		javascriptreact = { "lsp", "treesitter" },
		typescript = { "lsp", "treesitter" },
		typescriptreact = { "lsp", "treesitter" },
		html = { "lsp" },
		css = { "lsp" },
	},

	layout = {
		max_width = { 50, 0.2 },
		width = nil,
		min_width = 20,
		default_direction = "float",
		placement = "group",
	},
	close_behavior = "auto",
	default_bindings = true,
	disable_max_lines = 10000,
	disable_max_size = 2000000, -- Default 2MB
	filter_kind = false,
	highlight_mode = "split_width",
	highlight_closest = true,
	highlight_on_hover = false,
	highlight_on_jump = 300,
	icons = {},
	ignore = {
		unlisted_buffers = true,
		filetypes = {},
		buftypes = "special",
		wintypes = "special",
	},
	link_folds_to_tree = false,
	link_tree_to_folds = true,
	manage_folds = false,
	nerd_font = "auto",
	on_attach = nil,
	on_first_symbols = nil,
	open_automatic = false,
	post_jump_cmd = "normal! zz",
	close_on_select = false,
	show_guides = true,
	update_events = "TextChanged,InsertLeave",
	guides = {
		mid_item = "├─",
		last_item = "└─",
		nested_top = "│ ",
		whitespace = "  ",
	},
	float = {
		border = "rounded",
		relative = "cursor",
		max_height = 0.9,
		height = nil,
		min_height = { 8, 0.1 },
		override = function(conf)
			return conf
		end,
	},
	lsp = {
		diagnostics_trigger_update = true,
		update_when_errors = true,
		update_delay = 300,
	},

	treesitter = {
		update_delay = 300,
	},
	markdown = {
		update_delay = 300,
	},
})
