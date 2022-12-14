local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

local util = require("lspconfig.util")
local on_attach = require("lsp.on_attach")
local capabilities = require("lsp.capabilities")
local symbols = require("symbols")

capabilities.textDocument.completion.completionItem.snippetSupport = true

--sumneko dir
local root_dir = "C:/Users/Administrator/lua-language-server"
local server_bin = "/bin/lua-language-server.exe"

nvim_lsp.sumneko_lua.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { root_dir .. server_bin, "-E", root_dir .. "/main.lua" },
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim", "use" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

nvim_lsp.emmet_ls.setup({
	on_attach = on_attach,
	filetypes = { "html" },
	capabilities = capabilities,
})

nvim_lsp.html.setup({
	on_attach = on_attach,
	filetypes = { "html" },
	capabilities = capabilities,
})

nvim_lsp.cssls.setup({
	on_attach = on_attach,
	filetypes = { "css", "scss", "less" },
	capabilities = capabilities,
})

nvim_lsp.cssmodules_ls.setup({
	on_attach = on_attach,
	filetypes = { "css", "scss", "less" },
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = util.root_pattern("tailwind.config.js", "tailwind.config.ts"),
})

nvim_lsp.eslint.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.svelte.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.vuels.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.volar.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.jsonls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		json = {
			-- Schemas https://www.schemastore.org
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig*.json" },
					url = "https://json.schemastore.org/tsconfig.json",
				},
				{
					fileMatch = {
						".prettierrc",
						".prettierrc.json",
						"prettier.config.json",
					},
					url = "https://json.schemastore.org/prettierrc.json",
				},
				{
					fileMatch = { ".eslintrc", ".eslintrc.json" },
					url = "https://json.schemastore.org/eslintrc.json",
				},
				{
					fileMatch = { ".babelrc", ".babelrc.json", "babel.config.json" },
					url = "https://json.schemastore.org/babelrc.json",
				},
				{
					fileMatch = { "lerna.json" },
					url = "https://json.schemastore.org/lerna.json",
				},
				{
					fileMatch = { "now.json", "vercel.json" },
					url = "https://json.schemastore.org/now.json",
				},
				{
					fileMatch = {
						".stylelintrc",
						".stylelintrc.json",
						"stylelint.config.json",
					},
					url = "http://json.schemastore.org/stylelintrc.json",
				},
				{
					fileMatch = { "turbo.json" },
					url = "https://turborepo.org/schema.json",
				},
			},
		},
	},
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.clangd.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Diagnostic symbols in the sign column (gutter)
local signs = symbols.signs
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- local float_opts = {
-- 	focusable = true,
-- 	style = "minimal",
-- 	border = "rounded",
-- 	source = "always",
-- 	header = "",
-- 	prefix = "",
-- }

vim.diagnostic.config({
	-- virtual text
	virtual_text = true,
	-- show signs
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = { source = "always" },
})

-- virtual text icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = {
		spacing = 4,
		prefix = symbols.cube,
	},
	severity_sort = true,
})

-- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float_opts)
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float_opts)
