local status_ok, dockerls = pcall(require, "dockerls")
if not status_ok then
  return
end


dockerls.setup {
}
