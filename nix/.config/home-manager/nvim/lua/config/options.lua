-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.lazyvim_picker = "fzf"
vim.g.autoformat = false
vim.opt.smarttab = false
vim.opt.softtabstop = 0

local SetTab = function(args)
  local tabsize = tonumber(args.args) or 4
  vim.opt.tabstop = tabsize
  vim.opt.shiftwidth = tabsize
end
local UseSpace = function(args)
  local tabsize = tonumber(args.args) or 4
  SetTab({ args = tabsize })
  vim.opt.expandtab = true
end

local UseTab = function(args)
  local tabsize = tonumber(args.args) or 4
  SetTab({ args = tabsize })
  vim.opt.expandtab = false  -- Use tabs instead of spaces
end

vim.api.nvim_create_user_command(
  "UseTab", UseTab, { nargs = "?" }
)

vim.api.nvim_create_user_command(
  "UseSpace", UseSpace, { nargs = "?" }
)

vim.api.nvim_create_user_command(
  "SetTab", SetTab, { nargs = "?" }
)

UseSpace({ args = "4" })
