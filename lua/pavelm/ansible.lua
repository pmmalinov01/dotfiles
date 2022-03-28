local status_ok, ansible = pcall(require, "ansiblels")
if not status_ok then
  return
end


ansible.setup {
  on_attach = on_attach
}
