if not vim.g.loaded_neoformat then
	return
end

vim.cmd([[
  augroup fmt
    autocmd!
    autocmd BufWritePre * Neoformat
  augroup END
]])
