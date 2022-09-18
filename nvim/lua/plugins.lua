-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

local status_packer_ok, packer = pcall(require, "packer")
if not status_packer_ok then
	return
end

return packer.startup(function()
	-- core
	use("wbthomason/packer.nvim")

	-- basic
	use("tpope/vim-surround")
	use("hoob3rt/lualine.nvim")
	use("glepnir/dashboard-nvim")
	use("akinsho/nvim-bufferline.lua")
	use("fgheng/winbar.nvim")
	use({
		"SmiteshP/nvim-gps",
		requires = "nvim-treesitter/nvim-treesitter",
	})
	use("folke/trouble.nvim")
	use("nvim-lua/plenary.nvim")
	use("mbbill/undotree")
	use("windwp/nvim-autopairs")
	use("kyazdani42/nvim-web-devicons")
	use("sbdchd/neoformat")

	-- lsp
	use({
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	})

	use("hrsh7th/nvim-cmp")
	use({
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-path",
		requires = {
			"hrsh7th/nvim-cmp",
		},
	})
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("folke/lsp-colors.nvim")
	use("L3MON4D3/LuaSnip")
	use({
		"saadparwaiz1/cmp_luasnip",
		requires = { "L3MON4D3/LuaSnip" },
	})
	use({
		"rafamadriz/friendly-snippets",
		requires = { "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },
	})

	-- telescope
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use("nvim-telescope/telescope-file-browser.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("windwp/nvim-ts-autotag")
	use({
		"JoosepAlviste/nvim-ts-context-commentstring",
		requires = {
			"tpope/vim-commentary",
		},
	})

	-- git
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

	-- themes
	use({
		"svrana/neosolarized.nvim",
		requires = {
			"tjdevries/colorbuddy.nvim",
		},
	})
	use("ellisonleao/gruvbox.nvim")
	use("rebelot/kanagawa.nvim")

	-- highlight
	use("norcalli/nvim-colorizer.lua") -- highlight HEX color
	--use 'RRethy/vim-illuminate' -- highlight related words under cursor

	-- others
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	use("phaazon/hop.nvim") -- goto a word or line
	use("simrat39/rust-tools.nvim")
end)
