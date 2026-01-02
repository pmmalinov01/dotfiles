-- [[ Setting options ]]
-- See `:help vim.o`
-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Increase update time I am old
vim.opt.updatetime = 2500
vim.opt.timeoutlen = 3000

-- NOTE: You should make sure your terminal supports this
vim.opt.termguicolors = true

vim.opt.list = true
vim.opt.listchars = {tab = '» ', trail = '·', nbsp = '␣'}
-- The line beneath this is called `modeline`. See `:help modeline`
vim.opt.backup = false                          -- creates a backup file
vim.opt.wildmenu = true
vim.opt.wildignore = "**/.git/*"
vim.opt.filetype = "on"
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"
vim.opt.syntax = "on"
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang = "en_us"
vim.opt.mouse = "a"                   -- allow usage of the mouse in nvim
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.expandtab = true                        -- convers tabs to spaces
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.hlsearch = false                         -- highlight all matches on previous search pattern
vim.opt.breakindent = true
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.wrap = false                             -- wrap lines if too long
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.guicursor = "n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
vim.opt.incsearch = true
-- Show signs in the number column
vim.opt.showmode = false
vim.opt.shortmess:append "c"
vim.opt.winborder = 'rounded'

