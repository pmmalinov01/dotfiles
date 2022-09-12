local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require "pavelm.lsp.lsp-installer"
require("pavelm.lsp.handlers").setup()

