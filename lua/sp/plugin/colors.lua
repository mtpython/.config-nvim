return {
	{
		"olimorris/onedarkpro.nvim",
	},
	-- {
	--     'HUAHUAI23/nvim-quietlight',
	-- },
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		opts = {
			styles = {
				italic = false,
			},
			highlight_groups = {
				TelescopeBorder = { fg = "overlay", bg = "overlay" },
				TelescopeNormal = { fg = "subtle", bg = "overlay" },
				TelescopeSelection = { fg = "text", bg = "highlight_med" },
				TelescopeSelectionCaret = { fg = "love", bg = "highlight_med" },
				TelescopeMultiSelection = { fg = "text", bg = "highlight_high" },

				TelescopeTitle = { fg = "base", bg = "love" },
				TelescopePromptTitle = { fg = "base", bg = "pine" },
				TelescopePreviewTitle = { fg = "base", bg = "iris" },

				TelescopePromptNormal = { fg = "text", bg = "surface" },
				TelescopePromptBorder = { fg = "surface", bg = "surface" },
			},
		},
		config = function(_, opts)
			require("rose-pine").setup(opts)
		end,
	},
}
