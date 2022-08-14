
local status_ok, floatterm = pcall(require, "vim_floatterm")
if not status_ok then
  vim.notify("floatterm not found!")
  return
end

floatterm.setup {
}
