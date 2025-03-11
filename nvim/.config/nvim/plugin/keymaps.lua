vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("t", "<esc><esc>", "<c-\\><c-n>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("t", "<C-k>", "<c-\\><c-n><C-w><C-k>")

-- plugins custom keymaps
vim.keymap.set("n", "-", "<cmd>Oil<CR>")

-- quickfix
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

-- lsp specific
vim.keymap.set("n", "<leader>zig", "<cmd>LspRestart<CR>")
-- Lua (init.lua)
-- developer debuging
-- vim.keymap.set("n", "<space><space>sx", "<cmd>source %<CR>")
-- vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- vim.keymap.set("v", "<space>x", ":lua<CR>")
--
--
local function select_python_function(inner)
  local start_line = vim.fn.search("^\\s*def\\>", "bcnW")
  local end_line = vim.fn.search("^\\s*$\\|^\\s*\\S", "nW") - 1
  if start_line == 0 or end_line == -1 then
    return
  end
  vim.api.nvim_command(start_line .. "," .. end_line .. "normal! V")
end

-- Map to `yaf` (yank around function)
vim.keymap.set({ "x", "o" }, "af", select_python_function, { desc = "Around Python function" })
