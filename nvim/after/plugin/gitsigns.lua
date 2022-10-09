local status_gitsigns_ok, gitsigns = pcall(require, "gitsigns")
if not status_gitsigns_ok then
	return
end

gitsigns.setup({
	current_line_blame = true,
	preview_config = {
		border = "rounded",
		style = "minimal",
		relative = "cursor",
		focusable = false,
		row = 0,
		col = 1,
	},
})
