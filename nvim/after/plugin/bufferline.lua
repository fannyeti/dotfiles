local status_bufferline_ok, bufferline = pcall(require, "bufferline")
if not status_bufferline_ok then
	return
end

bufferline.setup({
	options = {
		mode = "tabs",
		separator_style = "thin",
		always_show_bufferline = false,
		show_buffer_close_icons = false,
		show_close_icon = false,
		color_icons = true,
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
	},
})
