-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.cmd('iabbr #i #include')
vim.cmd("iabbr #d #define")
vim.cmd("iabbr stativ static")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "c",
  callback = function(args)
    vim.cmd("iabbrev print prinf")
  end
})
vim.keymap.set("c", "w!!", "w !sudo tee > /dev/null %", { noremap = true })
vim.keymap.set("v", "<C-Down>", "<Plug>MoveBlockDown", { noremap = true })
vim.keymap.set("v", "<C-Up>", "<Plug>MoveBlockUp", { noremap = true })
vim.keymap.set("n", "<C-Down>", "<Plug>MoveLineDown", { noremap = true })
vim.keymap.set("n", "<C-Up>", "<Plug>MoveLineUp", { noremap = true })
vim.keymap.set("n", "<C-p>", '<cmd>Telescope find_files<cr><cmd><cr>', { noremap = true })
vim.keymap.set("n", "<C-b>", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr><cmd>Telescope buffers sort_mru=true sort_lastused=true<cr><cmd>Telescope buffers sort_mru=true sort_lastused=true<cr><cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", { noremap = true })
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true })
vim.keymap.set("n", "<F2>", ":bp<CR>", { noremap = true })
vim.keymap.set("n", "<F3>", ":bn<CR>", { noremap = true })
vim.keymap.set("n", "<F4>", ":bd<CR>", { noremap = true })
vim.keymap.set("n", "<F5>", ":tabp<CR>", { noremap = true })
vim.keymap.set("n", "<F6>", ":tabn<CR>", { noremap = true })
vim.keymap.set("n", "<F7>", ":tabc<CR>", { noremap = true })
vim.keymap.set("n", "<F9>", ":set hlsearch!<CR>", { noremap = true })
vim.keymap.set("n", "<F12>", ":set list!<CR>:redraw!<CR>", { noremap = true })
