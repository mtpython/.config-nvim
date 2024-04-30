return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			-- { "antosha417/nvim-lsp-file-operations", config = true },
			-- { "folke/neodev.nvim", opts = {} },
		},
		config = function()
			local lspconfig = require("lspconfig")
			local mason_lspconfig = require("mason-lspconfig")

			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(args)
					local opts = { buffer = args.buf, silent = true }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					-- -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
					vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
					vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
				end,
			})

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			mason_lspconfig.setup_handlers({
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,
				-- ["svelte"] = function()
				--     lspconfig["svelte"].setup({
				--         capabilities = capabilities,
				--         on_attach = function(client, bufnr)
				--             vim.api.nvim_create_autocmd("BufWritePost", {
				--                 pattern = { "*.js", "*.ts" },
				--                 callback = function(ctx)
				--                     -- Here use ctx.match instead of ctx.file
				--                     client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
				--                 end,
				--             })
				--         end,
				--     })
				-- end,
				-- ["emmet_ls"] = function()
				--     -- configure emmet language server
				--     lspconfig["emmet_ls"].setup({
				--         capabilities = capabilities,
				--         filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
				--     })
				-- end,
				-- ["lua_ls"] = function()
				--     lspconfig["lua_ls"].setup({
				--         capabilities = capabilities,
				--         settings = {
				--             Lua = {
				--                 -- make the language server recognize "vim" global
				--                 diagnostics = {
				--                     globals = { "vim" },
				--                 },
				--                 completion = {
				--                     callSnippet = "Replace",
				--                 },
				--             },
				--         },
				--     })
				-- end,
			})
		end,
	},
}
