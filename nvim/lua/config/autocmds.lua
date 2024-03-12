-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local hide_status = vim.api.nvim_create_augroup("user_hide_tmux_status", { clear = true })

-- Show the tmux statusline which was hidden when nvim started.
vim.api.nvim_create_autocmd({ "VimLeave", "VimSuspend" }, {
  group = hide_status,
  callback = function()
    vim.fn.system("tmux set status on")
  end,
})

-- Hide tmux statusline when entering nvim to reduce clutter.
vim.api.nvim_create_autocmd({ "VimResume", "VimEnter" }, {
  group = hide_status,
  callback = function()
    vim.fn.system("tmux set status off")
  end,
})
