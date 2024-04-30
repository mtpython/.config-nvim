return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				auto_install = true,
				highlight = {
					enable = true,
					-- additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				},
				autotag = {
					enable = true,
				},
			})
		end,
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "windwp/nvim-ts-autotag" },
}
