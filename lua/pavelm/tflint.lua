local status_ok, tflint = pcall(require, "tflint")
if not status_ok then
  return
end


tflint.setup {}
