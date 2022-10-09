local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "<S-C-p>", '"0p', opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Delete without yank
keymap.set("n", "<leader>d", '"_d', opts)
keymap.set("n", "x", '"_x', opts)

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- e in insert mode
keymap.set("i", "<C-e>", "<Esc>ea", opts)

-- b in insert mode
keymap.set("i", "<C-b>", "<Esc>bi", opts)

-- remap macro record key
keymap.set("n", "Q", "q", opts)

-- cancel q
keymap.set("n", "q", "<Nop>", opts)

-- no highlight
keymap.set("n", ";l", ":nohl<cr>", opts)

-- :q
keymap.set("n", ";q", ":q<cr>", opts)
keymap.set("n", ";Q", ":q!<cr>", opts)

-- :w
keymap.set("n", ";w", ":w<cr>", opts)

-- :bdelete
keymap.set("n", ";bd", ":bdelete<cr>", opts)
keymap.set("n", ";bD", ":bdelete!<cr>", opts)

-- move cursor to start of line, better ^
keymap.set("n", "<C-h>", "<Home>^", opts)
keymap.set("i", "<C-h>", "<Home><Esc>^i", opts)
keymap.set("v", "<C-h>", "<Home>^", opts)
keymap.set("n", "<C-S-h>", "<Home>", opts)
keymap.set("i", "<C-S-h>", "<Home><Esc>i", opts)
keymap.set("v", "<C-S-h>", "<Home>", opts)

-- better $
keymap.set("n", "<C-l>", "<End>", opts)
keymap.set("i", "<C-l>", "<End>", opts)
keymap.set("v", "<C-l>", "<End>", opts)

-- New tab
keymap.set("n", "te", ":tabedit<cr>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return><C-w>w")
keymap.set("n", "sv", ":vsplit<Return><C-w>w")

-- Move window
keymap.set("n", "<Space>", "<C-w>w")
keymap.set("", "sh", "<C-w>h")
keymap.set("", "sk", "<C-w>k")
keymap.set("", "sj", "<C-w>j")
keymap.set("", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

--[[plugins]]

-- bufferline.nvim
local status_bufferline_ok = pcall(require, "bufferline")
if status_bufferline_ok then
	keymap.set("n", "<s-tab>", ":BufferLineCyclePrev<CR>", opts)
	keymap.set("n", "<tab>", ":BufferLineCycleNext<CR>", opts)
	keymap.set("n", ";bp", ":BufferLinePick<CR>", opts)
	keymap.set("n", ";bc", ":BufferLinePickClose<CR>", opts)
end

-- lsp saga
local status_lspsaga_ok = pcall(require, "lspsaga")
if status_lspsaga_ok then
	keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", opts)
	keymap.set("n", "<C-j>", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
	keymap.set("n", "<C-k>", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
	keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", opts)
	keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", opts)
	keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", opts)
	keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", opts)
	keymap.set("n", ";ca", "<cmd>Lspsaga code_action<CR>", opts)
	keymap.set("v", ";ca", "<cmd><C-U>Lspsaga range_code_action<CR>", opts)
	keymap.set("n", ";o", "<cmd>LSoutlineToggle<CR>", opts)
end

-- hop
local status_hop_ok = pcall(require, "hop")
if status_hop_ok then
	-- word
	keymap.set(
		"n",
		"gw",
		"<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
		opts
	)
	keymap.set(
		"v",
		"gw",
		"<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END })<cr>",
		opts
	)
	keymap.set(
		"o",
		"gw",
		"<cmd> lua require'hop'.hint_words({ hint_position = require'hop.hint'.HintPosition.END, inclusive_jump = true })<cr>",
		opts
	)
	-- line
	keymap.set("n", "gl", ":HopLine<cr>", opts)
	keymap.set("v", "gl", ":HopLine<cr>", opts)
	keymap.set("o", "gl", ":HopLine<cr>", opts)
end

-- trouble
local status_trouble_ok = pcall(require, "trouble")
if status_trouble_ok then
	keymap.set("n", ";tt", "<cmd>TroubleToggle<cr>", opts)
	keymap.set("n", ";tw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opts)
	keymap.set("n", ";td", "<cmd>TroubleToggle document_diagnostics<cr>", opts)
	keymap.set("n", ";tl", "<cmd>TroubleToggle loclist<cr>", opts)
	keymap.set("n", ";tq", "<cmd>TroubleToggle quickfix<cr>", opts)
	keymap.set("n", ";tr", "<cmd>TroubleToggle lsp_references<cr>", opts)
end
