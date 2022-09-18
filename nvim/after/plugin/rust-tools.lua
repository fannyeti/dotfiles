local status_rust_tools_ok, rust_tools = pcall(require, "rust-tools")
if not status_rust_tools_ok then
	return
end

local on_attach = require("lsp.on_attach")
local capabilities = require("lsp.capabilities")

rust_tools.setup({
	tools = {
		inlay_hints = {
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},

	server = {
		on_attach = on_attach,
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {},
		},
	},
})
