local status_nvim_treesitter_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_nvim_treesitter_ok then
	return
end

configs.setup({
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = false,
		disable = {},
	},
	ensure_installed = {
		"javascript",
		"typescript",
		"tsx",
		"svelte",
		"json",
		"toml",
		"yaml",
		"html",
		"css",
		"python",
		"lua",
		"rust",
		"c",
		"cpp",
	},
})
