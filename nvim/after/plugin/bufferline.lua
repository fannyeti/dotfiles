local status_bufferline_ok, bufferline = pcall(require, "bufferline")
if not status_bufferline_ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thin",
		always_show_bufferline = false,
		show_close_icon = false,
		color_icons = true,
		indicator = {
			icon = "▋",
			style = "icon",
		},
		buffer_close_icon = "",
		modified_icon = " ",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		diagnostic = "nvim_lsp",
	},
	highlights = {
		fill = {
			bg = "#073642",
		},
		background = {
			fg = "#657b83",
			bg = "#073642",
		},
		separator = {
			fg = "#657b83",
			bg = "#073642",
		},
		buffer_selected = {
			fg = "#fdf6e3",
			bold = true,
			italic = false,
		},
		indicator_selected = {
			fg = "#268bd2",
		},
		close_button = {
			fg = "#657b83",
			bg = "#073642",
		},
		close_button_selected = {
			fg = "#dc322f",
		},
		diagnostic_visible = {
			fg = "#dc322f",
		},
		modified = {
			fg = "#859900",
			bg = "#073642",
		},
		modified_visible = {
			fg = "#859900",
			bg = "#073642",
		},
		modified_selected = {
			fg = "#859900",
		},
	},
})

vim.keymap.set("n", "<Tab>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", {})
