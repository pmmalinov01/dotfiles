local status_ok, gopls = pcall(require, "gopls")
if not status_ok then
  return
end


gopls.setup {}
