vim.g.netrw_banner = 0
vim.g.netrw_list_hide = "^./$"
vim.g.netrw_winsize = 0
vim.g.VM_mouse_mappings = 1
vim.g.VM_highlight_matches = "value"

vim.opt.fillchars = { eob = " " }

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.opt.inccommand = "split"
vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.updatetime = 50

vim.opt.colorcolumn = "40"
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.smarttab = true
vim.opt.ttimeoutlen = 100
vim.opt.laststatus = 2
vim.opt.sidescrolloff = 2
vim.opt.pumheight = 15
