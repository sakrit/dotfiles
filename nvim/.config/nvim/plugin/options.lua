local set = vim.opt

set.number = true
set.relativenumber = true
set.mouse = "a"
set.showmode = false

vim.schedule(function()
  set.clipboard = "unnamedplus"
end)

set.breakindent = true
set.undofile = true
set.ignorecase = true
set.smartcase = true
set.signcolumn = "yes"
set.updatetime = 250
set.timeoutlen = 400
set.splitright = true
set.splitbelow = true
set.list = true
set.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
set.inccommand = "split"
set.cursorline = true
set.scrolloff = 10
set.shiftwidth = 4
