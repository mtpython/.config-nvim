return {
	"echasnovski/mini.files",
	version = false,
	opts = {
		options = {
			permanent_delete = false,
		},
		windows = {
			-- preview = true,
			-- max_number = math.huge,
			width_focus = 30,
			width_preview = 30,
		},
	},
	config = function(_, opts)
		local mini = require("mini.files")
		mini.setup(opts)

		local show_dotfiles = false

		local filter_show = function(_)
			return true
		end

		local filter_hide = function(fs_entry)
			return not vim.startswith(fs_entry.name, ".")
		end

		local toggle_dotfiles = function()
			show_dotfiles = not show_dotfiles
			local new_filter = show_dotfiles and filter_show or filter_hide
			mini.refresh({ content = { filter = new_filter } })
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				-- Tweak left-hand side of mapping to your liking
				vim.keymap.set("n", "H", toggle_dotfiles, { buffer = buf_id })
			end,
		})

		vim.keymap.set("n", "<leader>pv", "<cmd>lua MiniFiles.open()<cr>")
		vim.keymap.set("n", "=-", function()
			mini.open()
		end)
		vim.keymap.set("n", "-", function()
			mini.open(vim.api.nvim_buf_get_name(0), false)
		end)
	end,
}
