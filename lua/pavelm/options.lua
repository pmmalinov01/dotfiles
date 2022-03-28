-- :help options

vim.opt.backup = false                          -- creates a backup file
vim.opt.wildmode = { "longest","list","full"}   -- Nice menu when typing :finm
vim.opt.wildmenu = true
vim.opt.wildignore = "**/.git/*"
vim.opt.filetype = "on" 
vim.opt.filetype.plugin = "on"
vim.opt.filetype.indent = "on"
vim.opt.syntax = "on"
vim.opt.vb = true
vim.opt.ruler = true
vim.opt.spelllang = "en_us"
vim.opt.mouse = "a" 				                    -- allow usage of the mouse in nvim
vim.opt.clipboard = "unnamedplus"               -- allows neovim to access the system clipboard
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.expandtab = true                        -- convers tabs to spaces
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.cmdheight = 2                           -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                        -- so that `` is visible in markdown files
vim.opt.fileencoding = "utf-8"                  -- the encoding written to a file
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.ignorecase = true                       -- ignore case in search patterns
vim.opt.guifont = "monospace:h17"               -- the font used in graphical neovim applications
vim.opt.scrolloff = 8                           -- is one of my fav
vim.opt.pumheight = 10                          -- pop up menu height
vim.opt.showmode = true                        -- we don't need to see things like -- INSERT -- anymore
--vim.opt.showtabline = 2                         -- always show tabs
vim.opt.smartcase = true                        -- smart case
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.tabstop = 2                             -- number of spaces to incert with Tab
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.updatetime = 300                        -- faster completion (4000ms default)
--vim.opt.cursorline = true                       -- highlight the current line
vim.opt.wrap = true                             -- wrap lines if too long
vim.termguicolors = true


vim.cmd [[set iskeyword+=-]] -- deltes asdf-asdf (inlcudes dash`-`)