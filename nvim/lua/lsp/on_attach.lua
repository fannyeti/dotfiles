local on_attach = function(client, bufnr)
	--Highlight symbol under cursor
	if client.server_capabilities.documentHighlightProvider then
		vim.cmd([[
	    hi! LspReferenceRead  guibg=#004A5C
	    hi! LspReferenceText guibg=#004A5C
	    hi! LspReferenceWrite guibg=#004A5C]])

		vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
		vim.api.nvim_clear_autocmds({ buffer = bufnr, group = "lsp_document_highlight" })
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})
		vim.api.nvim_create_autocmd("CursorMoved", {
			group = "lsp_document_highlight",
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end

	--keymaps
	-- local function buf_set_keymap(...)
	-- 	vim.api.nvim_buf_set_keymap(bufnr, ...)
	-- end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	--
	--local opts = { noremap = true, silent = true }
	-- buf_set_keymap("n", "<C-k>", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', opts)
	-- buf_set_keymap("n", "<C-j>", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', opts)
	-- buf_set_keymap("n", "K", '<Cmd>lua vim.lsp.buf.hover({ border = "rounded" })<CR>', opts)
	-- buf_set_keymap("i", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	-- buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	-- buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
end
return on_attach
