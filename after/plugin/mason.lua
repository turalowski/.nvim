local mason = require("mason")
local lspconfig = require("mason-lspconfig")
local null_ls = require("mason-null-ls")

mason.setup()

lspconfig.setup({
	ensure_installed = {
		"tsserver",
		"html",
		"pyright",
		"cssls",
		"lua_ls",
		"eslint",
		"glint",
	},
})

null_ls.setup({
	ensure_installed = {
		"prettier",
		"stylua",
		"eslint_d",
		"black",
	},
})
