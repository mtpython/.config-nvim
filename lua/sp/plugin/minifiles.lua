return {
	"echasnovski/mini.files",
	version = false,
	opts = {
		options = {
			permanent_delete = false,
		},
		windows = {
			preview = true,
			-- max_number = math.huge,
			width_focus = 30,
			width_preview = 30,
		},
	},
	config = function(_, opts)
		require("mini.files").setup(opts)
		vim.keymap.set("n", "<leader>pv", "<cmd>lua MiniFiles.open()<cr>")
		vim.keymap.set("n", "-", "<cmd>lua MiniFiles.open()<cr>")
	end,
}
