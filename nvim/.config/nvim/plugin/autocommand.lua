vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.bo.filetype = "terminal"
  end,
})
-- small terminal at the bottom
local job_id = 0
vim.keymap.set("n", "<space>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 12)
  job_id = vim.bo.channel
end)

-- run specific command into bottom terminal
vim.keymap.set("n", "<space>go", function()
  local file_name = vim.fn.expand("%:p")
  local file_type = vim.fn.fnamemodify(file_name, ":e")
  local command = ""
  print(vim.fn.expand("%:p"))
  if file_type == "c" then
    vim.api.nvim_chan_send(job_id, "zig cc " .. file_name .. " && ./a.out\n")
  elseif file_type == "lua" then
    -- vim.api.nvim_chan_send(job_id, "print('Hello from Lua!')\n")
    -- print("This is a lua file")
  elseif file_type == "cpp" then
    vim.api.nvim_chan_send(job_id, "g++ " .. file_name .. " && ./a.out\n")
    -- vim.api.nvim_chan_send(job_id, "gcc " .. file_name .. " && ./a.out\n")
  elseif file_type == "py" then
    vim.api.nvim_chan_send(job_id, "python3 " .. file_name .. "\n")
  elseif file_type == "ts" then
    vim.api.nvim_chan_send(job_id, "ts-node " .. file_name .. "\n")
  else
    print("command not specified")
  end
end)
