-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
augroup end
]])

-- Only required if you have packer configured as `opt`
vim.cmd.packadd("packer.nvim")

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")
	-- File finder
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({
		"nvim-telescope/telescope-file-browser.nvim",
	})

	-- Highlighting
	use({ "nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" } })
	use({ "nvim-treesitter/playground" })

	-- Harpoon
	use({ "ThePrimeagen/harpoon" })

	-- Undotree
	use({ "mbbill/undotree" })

	-- Auto completion
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	-- Snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	use("saadparwaiz1/cmp_luasnip") -- snippet completions

	-- managing & installing lsp servers, linters & formatters
	use({ "williamboman/mason.nvim", run = ":MasonUpdate" }) -- simple to use language server installer
	use("williamboman/mason-lspconfig.nvim") -- it helps to make bridge between mason and lsp

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- enable LSP
	use("hrsh7th/cmp-nvim-lsp") -- Auto completion
	use({
		"glepnir/lspsaga.nvim",
		branch = "main",
	})
	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")

	-- Better UI
	use("jose-elias-alvarez/typescript.nvim") -- Better ts support

	--Themes
	use({
		"rose-pine/neovim",
		as = "rose-pine",
	})
	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use({ "sainnhe/gruvbox-material", as = "gruvbox" })
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- Maximizer
	use({
		"szw/vim-maximizer",
	})
	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
	use("airblade/vim-gitgutter")

	-- Show colors
	use("norcalli/nvim-colorizer.lua")

	-- Tmux
	use({
		"aserowy/tmux.nvim",
		config = function()
			require("tmux").setup()
		end,
	})

	-- Transparent background
	use("xiyaowong/nvim-transparent")

	-- Status line
	use("nvim-lualine/lualine.nvim")

	-- Markdown
	use({
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	})
	-- Comment
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	-- Codepilot
	use("github/copilot.vim")
	-- Surround
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
end)
