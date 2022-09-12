local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.terraformls.setup{
  flags = { debounce_text_changes = 150 },
  capabilities = capabilities,
}

vim.cmd [[
  autocmd BufWritePre *.tf lua vim.lsp.buf.formatting()
  autocmd BufRead,BufNewFile *.hcl set filetype=hcl
  autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=tf
  autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
]]
