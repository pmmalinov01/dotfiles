require('nvim-treesitter.configs').setup {
  ensure_installed = "all",
  auto_install = true,
  highlight = { 
    enable = true ,
    disable = { "phpdoc", "tree-sitter-phpdoc" }, 
  },
  indent = { enable = true },
  ignore_install = { "phpdoc",  "tree-sitter-phpdoc" }
}
