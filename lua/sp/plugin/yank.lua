return {
	"gbprod/yanky.nvim",
	dependencies = { "kkharji/sqlite.lua" },
	config = function()
		require("telescope").load_extension("yank_history")
		local utils = require("yanky.utils")
		local mapping = require("yanky.telescope.mapping")

		local opts = {
			ring = {
				history_length = 3000,
				storage = "sqlite",
				-- ignore_registers = { "_" },
			},
			system_clipboard = {
				sync_with_ring = true,
			},
			highlight = {
				on_put = false,
				on_yank = false,
			},
			preserve_cursor_position = {
				enabled = true,
			},
			picker = {
				select = {
					action = nil,
				},
				telescope = {
					use_default_mappings = false,
					mappings = {
						default = mapping.put("p"),
						i = {
							["<C-p>"] = mapping.put("p"),
							["<C-P>"] = mapping.put("P"),
							["<C-Enter>"] = mapping.set_register(utils.get_default_register()),
						},
						n = {
							p = mapping.put("p"),
							P = mapping.put("P"),
							-- d = mapping.delete(),
						},
					},
				},
			},
		}

		require("yanky").setup(opts)

		-- vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
		-- vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
		-- vim.keymap.set({ "n", "x" }, "gp", "<Plug>(YankyGPutAfter)")
		-- vim.keymap.set({ "n", "x" }, "gP", "<Plug>(YankyGPutBefore)")
		-- vim.keymap.set({ "o", "x" }, "lp", function()
		-- 	require("yanky.textobj").last_put()
		-- end, {})
		vim.keymap.set("n", "=p", "<Plug>(YankyPutAfterFilter)")
		vim.keymap.set({ "n", "x" }, "y", "<Plug>(YankyYank)")
		vim.keymap.set({ "n", "x" }, "<leader>cl", "<cmd>Telescope yank_history<cr>")
		-- vim.keymap.set("x", "p", "<Plug>(YankyPutBefore)", { desc = "Paste without copying replaced text" })
	end,
}
