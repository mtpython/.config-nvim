return {
	-- {
	--     "nvim-telescope/telescope-ui-select.nvim",
	-- },
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			local telescope = require("telescope")
			local actions = require("telescope.actions")

			-- config = function()
			--       require("telescope").setup({
			--         extensions = {
			--           ["ui-select"] = {
			--             require("telescope.themes").get_dropdown({}),
			--           },
			--         },
			--       })

			telescope.setup({
				defaults = {
					path_display = { "truncate" },
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous,
							["<C-j>"] = actions.move_selection_next,
							-- ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, --+ custom_actions.open_trouble_qflist,
							-- ["<C-t>"] = trouble_telescope.smart_open_with_trouble,
						},
					},
				},
			})

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>pf", function()
				builtin.find_files({ hidden = true })
			end)
			vim.keymap.set("n", "<C-p>", function()
				builtin.git_files()
			end)
			vim.keymap.set("n", "<leader>ps", function()
				builtin.grep_string({ search = vim.fn.input("Grep › ") })
			end)
			vim.keymap.set("n", "<leader>pr", function()
				builtin.oldfiles({})
			end)
			vim.keymap.set("n", "<leader>pS", function()
				builtin.live_grep({})
			end)
			vim.keymap.set("n", "<leader>pws", function()
				builtin.grep_string({})
			end)
			vim.keymap.set("n", "<leader>pt", function()
				builtin.treesitter({})
			end)
			-- require("telescope").load_extension("ui-select")
		end,
	},
}
