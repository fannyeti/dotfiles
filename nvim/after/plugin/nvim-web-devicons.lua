local status_nvim_web_devicons_ok, nvim_web_devicons = pcall(require, "nvim-treesitter.configs")
if not status_nvim_web_devicons_ok then
	return
end

nvim_web_devicons.setup({
	override = {},
	default = true,
})
