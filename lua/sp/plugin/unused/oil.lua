return {
	"stevearc/oil.nvim",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lua.sp.plugin.unused.oil").setup({
			delete_to_trash = true,
			-- skip_confirm_for_simple_edits = false,
			view_options = {
				-- Show files and directories that start with "."
				show_hidden = true,
				-- This function defines what is considered a "hidden" file
				-- is_hidden_file = function(name, bufnr)
				-- 	return vim.startswith(name, ".")
				-- end,
				-- This function defines what will never be shown, even when `show_hidden` is set
				-- is_always_hidden = function(name, bufnr)
				-- 	return false
				-- end,
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		vim.keymap.set("n", "<leader>pv", "<cmd>Oil<cr>")
	end,
}
