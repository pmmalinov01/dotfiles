local status_ok, terraformls = pcall(require, "terraformls")
if not status_ok then
  return
end


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
terraformls.setup({
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
  capabilities = capabilities,
})

vim.cmd [[
  autocmd BufWritePre *.tf lua vim.lsp.buf.formatting()
  autocmd BufRead,BufNewFile *.hcl set filetype=hcl
  autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl
  autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform
  autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json
]]
