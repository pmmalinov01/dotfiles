local status_ok, bashls = pcall(require, "bashls")
if not status_ok then
  return
end

bashls.setup {
  on_attach = on_attach
}
