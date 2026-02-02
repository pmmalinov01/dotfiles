-- Start the GH actions language server
-- Requries `npm i -g @strozw/github-actions-languageserver`
vim.api.nvim_create_autocmd("FileType", {
  pattern = "github-actions-workflow",
  callback = function()
    vim.lsp.start({
      name = "gh-actions-ls",
      filetypes = { "github-actions-workflow" },
      cmd = { "npx", "github-actions-languageserver", "--stdio" },
      root_dir = vim.fn.getcwd(),
      init_options = {
        sessionToken = "",
      },
      settings = {},
    })
  end,
})

-- Set specify yaml files to be of type github-actions-workflow
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yaml set filetype=github-actions-workflow")
vim.cmd("autocmd BufRead,BufNewFile *.github/workflows/*.yml set filetype=github-actions-workflow")
--vim.treesitter.language.register("yaml", "github-actions-workflow")
vim.cmd [[set iskeyword+=-]] -- deltes asdf-asdf (inlcudes dash`-`)
vim.cmd [[set ma]]
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
vim.cmd([[let g:terraform_fmt_on_save=1]])
vim.cmd([[let g:terraform_align=1]])
-- set file type to helm for lsp to work?
vim.cmd("autocmd BufRead, BufNewFile */templates/*.yaml set filetype=helm")
