local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")
local typescript = require("typescript")

local keymap = vim.keymap

-- enable keybinds for availabe lsp server
local on_attach = function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)

	keymap.set("n", "gf", function()
		vim.lsp.buf.references()
	end, opts)
	keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)

	keymap.set("n", "ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	keymap.set("n", "rn", function()
		vim.lsp.buf.rename()
	end, opts)

	if client.name == "tsserver" then
		keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")
	end
end

local capabilities = cmp_nvim_lsp.default_capabilities()

-- HTML
lspconfig["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Pyright
lspconfig["pyright"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- Typescript
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
	},
	on_attach = function(client)
		client.resolved_capabilities.document_formatting = false
	end,
})

-- CSS
lspconfig["cssls"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- TailwindCSS
lspconfig["tailwindcss"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

lspconfig["prismals"].setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- LUA
lspconfig["lua_ls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
		},
	},
})
