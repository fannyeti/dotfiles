local status_colorizer_ok, colorizer = pcall(require, "colorizer")
if not status_colorizer_ok then
	return
end

colorizer.setup({
	"*",
})
