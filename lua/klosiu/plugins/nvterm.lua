local status, nvterm = pcall(require, 'nvterm')
if not status then
  return
end

nvterm.setup()
