local status_ok, gopls = pcall(require, "gopls")
if not status_ok then
  return
end


gopls.setup {
  go = "go",
  capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()),
  on_attach = require('lsp.utils').on_attach,
  icons = {breakpoint = "🧘", currentpos = "🏃"},
}
