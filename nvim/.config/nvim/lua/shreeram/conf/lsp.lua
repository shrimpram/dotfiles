local mason = require("mason")
local lspconfig = require("lspconfig")
local mason_lsp = require("mason-lspconfig")
local null_ls = require("null-ls")
local lsp_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

mason.setup({
	ensure_installed = {
		"black",
		"clang-format",
		"latexindent",
		"prettier",
		"shellcheck",
		"shfmt",
		"rustywind",
	},
})

mason_lsp.setup({
	ensure_installed = {
		"bashls",
		"clangd",
		"html",
		"jdtls",
		"kotlin_language_server",
		"lua_ls",
		"pyright",
		"texlab",
		"tsserver",
	},
})

lspconfig.clangd.setup({})
lspconfig.cssls.setup({})
lspconfig.html.setup({})
lspconfig.kotlin_language_server.setup({})

require("lspconfig").lua_ls.setup({
	settings = {
		Lua = {
			completion = {
				-- callSnippet = "Replace",
				-- keywordSnippet = "Replace",
			},
			diagnostics = {
				globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
			},
		},
	},
})

lspconfig.texlab.setup({
	settings = {
		texlab = {
			diagnostics = {
				ignoredPatterns = { "Undefined reference" },
			},
		},
	},
})
lspconfig.tsserver.setup({})
lspconfig.jdtls.setup({})
lspconfig.pyright.setup({})

null_ls.setup({
	sources = {
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.rustywind,
		null_ls.builtins.formatting.stylua,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = lsp_augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = lsp_augroup,
				buffer = bufnr,
				callback = function()
					-- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
					-- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
					vim.lsp.buf.format()
				end,
			})
		end
	end,
})
