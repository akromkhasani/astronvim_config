-- Configure plugins
return {
	-- Add plugins, the packer syntax without the "use"
	init = {
		-- You can disable default plugins as follows:
		-- ["goolord/alpha-nvim"] = { disable = true },

		-- You can also add new plugins here as well:
		-- { "andweeb/presence.nvim" },
		-- {
		--   "ray-x/lsp_signature.nvim",
		--   event = "BufRead",
		--   config = function()
		--     require("lsp_signature").setup()
		--   end,
		-- },
		{ "f-person/git-blame.nvim" },
	},
	-- All other entries override the setup() call for default plugins
	["null-ls"] = function(config)
		local null_ls = require("null-ls")
		-- Check supported formatters and linters
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
		-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
		config.sources = {
			-- Set a formatter
			null_ls.builtins.formatting.stylua,
			null_ls.builtins.diagnostics.selene,
			null_ls.builtins.formatting.shfmt,
			null_ls.builtins.diagnostics.shellcheck,
			null_ls.builtins.formatting.prettier,
			null_ls.builtins.diagnostics.yamllint,
			null_ls.builtins.formatting.black,
			null_ls.builtins.formatting.isort.with({
				generator_opts = {
					command = "isort",
					args = {
						"--stdout",
						"--profile",
						"black",
						"--filename",
						"$FILENAME",
						"-",
					},
					to_stdin = true,
				},
			}),
			null_ls.builtins.diagnostics.mypy,
			null_ls.builtins.formatting.gofmt,
			null_ls.builtins.formatting.goimports,
			null_ls.builtins.diagnostics.golangci_lint,
		}
		-- set up null-ls's on_attach function
		-- config.on_attach = function(client)
		-- 	-- NOTE: You can remove this on attach function to disable format on save
		-- 	if client.resolved_capabilities.document_formatting then
		-- 		vim.api.nvim_create_autocmd("BufWritePre", {
		-- 			desc = "Auto format before save",
		-- 			pattern = "<buffer>",
		-- 			callback = vim.lsp.buf.formatting_sync,
		-- 		})
		-- 	end
		-- end
		return config -- return final config table
	end,
	treesitter = {
		ensure_installed = {
			"lua",
			"bash",
			"json",
			"yaml",
			"toml",
			"markdown",
			"python",
			"go",
			"typescript",
		},
	},
	-- use mason-lspconfig to configure LSP installations
	["mason-lspconfig"] = {
		ensure_installed = {
			"sumneko_lua",
			"lua-language-server",
			"bash-language-server",
			"json-lsp",
			"yaml-language-server",
			"pyright",
			"typescript-language-server",
		},
	},
	-- use mason-tool-installer to configure DAP/Formatters/Linter installation
	["mason-tool-installer"] = {
		ensure_installed = {
			"stylua",
			"selene",
			"shfmt",
			"shellcheck",
			"prettier",
			"yamllint",
		},
	},
	packer = {
		compile_path = vim.fn.stdpath("data") .. "/packer_compiled.lua",
	},
}
